//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation

extension Container {

  /// Factory for creating ``FileManager`` instances that conform to ``FileManagerProtocol``.
  ///
  /// Returns a new ``FileManager`` instance for device file manager to cache data.
  var fileManager: Factory<any FileManagerProtocol> {
    self { FileManager.default }
  }

  /// Factory for creating ``ImageCacheService`` instances that conform to ``ImageCacheProtocol``.
  ///
  /// Returns a new ``ImageCacheService`` instance for caching images.
  var imageCache: Factory<any ImageCacheProtocol> {
    self { ImageCacheService() }
  }

  /// Factory for creating server instances that conform to ``ServerProtocol``.
  ///
  /// Returns a new ``ServerService`` instance for handling server requests.
  var server: Factory<any ServerProtocol> {
    self { ServerService() }
  }

  /// Factory for accessing ``URLSession`` instances that conform to ``URLSessionProtocol``.
  ///
  /// Returns a configured ``URLSession`` instance for handling network requests.
  var urlSession: Factory<any URLSessionProtocol> {
    self {
      let megabyte = 1024 * 1024
      let configuration = URLSessionConfiguration.default
      configuration.urlCache = URLCache(
        memoryCapacity: 10 * megabyte,
        diskCapacity: 100 * megabyte
      )
      return URLSession(configuration: configuration)
    }
  }
}
