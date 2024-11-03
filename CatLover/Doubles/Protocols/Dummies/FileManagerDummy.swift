//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class FileManagerDummy: FileManagerProtocol {

  // Protocol requirement
  func urls(
    for directory: FileManager.SearchPathDirectory,
    in domainMask: FileManager.SearchPathDomainMask
  ) -> [URL] {
    []
  }

  func createDirectory(
    at url: URL,
    withIntermediateDirectories createIntermediates: Bool,
    attributes: [FileAttributeKey : Any]?
  ) throws {
    // Intentionally empty
  }

  func removeItem(at url: URL) throws {
    // Intentionally empty
  }

  func contentsOfDirectory(
    at url: URL,
    includingPropertiesForKeys keys: [URLResourceKey]?,
    options mask: FileManager.DirectoryEnumerationOptions
  ) throws -> [URL] {
    []
  }
}
