//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class FileManagerSpy: FileManagerProtocol {

  // Spy values
  var urlsIsCalled: Bool = false
  var createDirectoryIsCalled = false
  var removeItemIsCalled: Bool = false
  var contentsOfDirectoryIsCalled: Bool = false
  var urlCount: Int = .zero
  var createDirectoryCount: Int = .zero
  var removeItemCount: Int = .zero
  var contentsOfDirectoryCount: Int = .zero
  var directory: FileManager.SearchPathDirectory?
  var domainMask: FileManager.SearchPathDomainMask?
  var url: URL?
  var createIntermediates: Bool?
  var attributes: [FileAttributeKey : Any]?
  var keys: [URLResourceKey]?
  var mask: FileManager.DirectoryEnumerationOptions?

  // Protocol requirement
  func urls(
    for directory: FileManager.SearchPathDirectory,
    in domainMask: FileManager.SearchPathDomainMask
  ) -> [URL] {
    urlsIsCalled = true
    urlCount += 1
    self.directory = directory
    self.domainMask = domainMask
    return []
  }

  func createDirectory(
    at url: URL,
    withIntermediateDirectories createIntermediates: Bool,
    attributes: [FileAttributeKey : Any]?
  ) throws {
    createDirectoryIsCalled = true
    createDirectoryCount += 1
    self.url = url
    self.createIntermediates = createIntermediates
    self.attributes = attributes
  }

  func removeItem(at url: URL) throws {
    removeItemIsCalled = true
    removeItemCount += 1
    self.url = url
  }

  func contentsOfDirectory(
    at url: URL,
    includingPropertiesForKeys keys: [URLResourceKey]?,
    options mask: FileManager.DirectoryEnumerationOptions
  ) throws -> [URL] {
    contentsOfDirectoryIsCalled = true
    contentsOfDirectoryCount += 1
    self.url = url
    self.keys = keys
    self.mask = mask
    return []
  }
}
