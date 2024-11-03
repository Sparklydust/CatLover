//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class FileManagerMock: FileManagerProtocol {

  // Mock values
  var urlsStub: [URL] = []
  var createDirectoryErrorStub: (any Error)?
  var removeItemErrorStub: (any Error)?
  var contentsOfDirectoryStub: [URL] = []

  // Protocol requirement
  func urls(
    for directory: FileManager.SearchPathDirectory,
    in domainMask: FileManager.SearchPathDomainMask
  ) -> [URL] {
    urlsStub
  }

  func createDirectory(
    at url: URL,
    withIntermediateDirectories createIntermediates: Bool,
    attributes: [FileAttributeKey : Any]?
  ) throws {
    guard createDirectoryErrorStub == nil else { throw createDirectoryErrorStub! }
  }

  func removeItem(at url: URL) throws {
    // Intentionally empty
  }

  func contentsOfDirectory(
    at url: URL,
    includingPropertiesForKeys keys: [URLResourceKey]?,
    options mask: FileManager.DirectoryEnumerationOptions
  ) throws -> [URL] {
    contentsOfDirectoryStub
  }
}
