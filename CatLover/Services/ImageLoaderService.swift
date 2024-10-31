//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import UIKit

final actor ImageLoaderService: ImageLoaderProtocol {

  @Injected(\.imageCache) private var imageCache
  @Injected(\.urlSession) private var urlSession
}

// MARK: - ImageLoaderProtocol
extension ImageLoaderService {

  func loadImage(urlString: String?) async -> UIImage? {
    guard let urlString, let url = URL(string: urlString) else { return .none }
    let fileName = urlString.extractedFileName

    if let cachedData = try? await imageCache.read(name: fileName) {
      return UIImage(data: cachedData)
    }
    do {
      let data = try await urlSession.data(from: url).0
      try await imageCache.write(data, name: fileName)
      return UIImage(data: data)
    } catch { return .none }
  }
}
