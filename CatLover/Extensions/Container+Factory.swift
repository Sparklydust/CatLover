//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation

extension Container {

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
