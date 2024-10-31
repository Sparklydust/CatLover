//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import ImageIO
import OSLog
import UIKit

final actor ImageCacheService: ImageCacheProtocol {

  /// Main Information attributes about a saved image in ``FileManager``.
  typealias SavedImageInfo = [(url: URL, lastAccessed: Date, size: Int)]

  /// The URL of the folder within Application Support Directory to be used for storage.
  /// - Info: Temporary placeholder path for `cacheDirectory` to satisfy initialization
  private var cacheDirectory = URL(fileURLWithPath: "/tmp")

  /// The memory limit that can be used to cache images.
  private let memoryLimit = Int(1e+9) // 1GB
  private let inMemoryCacheLimit = Int(5e+7) // 50MB
  private let inMemoryCache = NSCache<NSString, NSData>()

  /// Defines the storage mode for `ImageCacheService`.
   /// - `disk`: Caches data on disk, allowing persistence between app sessions.
   /// - `inMemory`: Caches data only in memory, suitable for temporary storage or testing.
  enum StorageMode {
    case disk
    case inMemory
  }
  enum ImageCacheError: Error {
    case downsamplingImageFails
  }

  @Injected(\.fileManager) private var fileManager

  init(storageMode: StorageMode = .disk) {
    if storageMode == .disk {
      Task { await configureCacheDirectory() }
    }
  }
}

// MARK: - Setup
extension ImageCacheService {

  /// Configure `cacheDirectory` after the actor is initialized.
  private func configureCacheDirectory() async {
    inMemoryCache.totalCostLimit = inMemoryCacheLimit
    inMemoryCache.countLimit = 100

    let directory = fileManager
      .urls(for: .cachesDirectory, in: .userDomainMask)[.zero]
      .appendingPathComponent("clipshop_database", isDirectory: true)

    cacheDirectory = directory

    do {
      try fileManager.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
    } catch {
      Logger().error("\(error.localizedDescription)")
    }
  }

  /// The URL of the data to cache in the device memory.
  /// - Parameter name: The name of the data to cache used at its id.
  /// - Returns: The URL directory where the data is cached.
  private func cacheURL(for name: String) -> URL {
    cacheDirectory.appendingPathComponent(name)
  }
}

// MARK: - File Management
extension ImageCacheService {

  func write(_ data: Data, name: String) async throws {
    let cacheName = NSString(string: name)
    guard let downsampledData = downsampleImage(data: data)
    else { throw ImageCacheError.downsamplingImageFails }
    inMemoryCache.setObject(NSData(data: downsampledData), forKey: cacheName)
    try data.write(to: cacheURL(for: name), options: .atomic)
    Task(priority: .background) { try await cleanMemorySurplus() }
  }

  func read(name: String) async throws -> Data {
    let cacheName = NSString(string: name)
    if let cachedData = inMemoryCache.object(forKey: cacheName) {
      return Data(referencing: cachedData)
    } else {
      let data = try Data(contentsOf: cacheURL(for: name))
      inMemoryCache.setObject(NSData(data: data), forKey: cacheName)
      return data
    }
  }

  /// Removes a file with the specified name from disk storage.
  /// - Parameter name: The name of the saved data.
  private func remove(name: String) throws {
    try fileManager.removeItem(at: cacheURL(for: name))
  }
}

// MARK: - Memory Management
extension ImageCacheService {

  /// Deletes files until the total size is within the desired limit, starting from the
  /// oldest accessed files.
  private func cleanMemorySurplus() async throws {

    let files = try persistedFilesWithAttributes()
    let currentUsage = files.reduce(.zero) { $0 + $1.size }

    guard currentUsage > memoryLimit else { return }

    var accumulatedSize: Int = .zero
    var filesToDelete: [URL] = []
    let targetUsage = memoryLimit / 2

    for file in files.sorted(by: { $0.lastAccessed < $1.lastAccessed }) {
      accumulatedSize += file.size
      filesToDelete.append(file.url)

      if accumulatedSize >= currentUsage - targetUsage {
        break
      }
    }
    try filesToDelete.forEach { try fileManager.removeItem(at: $0) }
  }

  /// Retrieves a list of files with their last accessed date and size.
  /// - Returns: An array of tuples containing the URL, last accessed date, and size of each file.
  private func persistedFilesWithAttributes() throws -> SavedImageInfo {
    return try fileManager
      .contentsOfDirectory(
        at: cacheDirectory,
        includingPropertiesForKeys: [.contentAccessDateKey, .totalFileAllocatedSizeKey],
        options: []
      )
      .map { url in
        let attributes = try url
          .resourceValues(forKeys: [.contentAccessDateKey, .totalFileAllocatedSizeKey])

        return (
          url: url,
          lastAccessed: attributes.contentAccessDate ?? Date.distantPast,
          size: attributes.totalFileAllocatedSize ?? .zero
        )
      }
  }
}

// MARK: - Downsample Image
extension ImageCacheService {

  /// Downsamples an image to the target size for efficient caching.
  /// - Parameter data: The original image data.
  /// - Returns: A downsampled `Data` object, if successful.
  private func downsampleImage(data: Data) -> Data? {
    guard let imageSource = CGImageSourceCreateWithData(data as CFData, nil) else { return .none }
    let targetSize = CGSize(width: 200, height: 200)
    let options: [NSString: Any] = [
      kCGImageSourceThumbnailMaxPixelSize: max(targetSize.width, targetSize.height),
      kCGImageSourceCreateThumbnailFromImageAlways: true,
      kCGImageSourceShouldCacheImmediately: true,
      kCGImageSourceCreateThumbnailWithTransform: true
    ]
    guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(
      imageSource, .zero, options as CFDictionary
    ) else { return .none }
    let uiImage = UIImage(cgImage: downsampledImage)
    return uiImage.jpegData(compressionQuality: 0.7)
  }
}
