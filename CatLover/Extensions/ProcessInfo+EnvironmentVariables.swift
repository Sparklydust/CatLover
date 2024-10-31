//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

extension ProcessInfo {

  /// Retrieves the CatLover API key from the environment variables to access the API key required for
  /// network requests to TheCatAPI.
  ///
  /// You can obtain an API key from TheCatAPI by visiting [TheCatAPI](https://thecatapi.com)
  /// - Warning: Ensure `CAT_API_KEY` is set in your Xcode scheme's environment variables.
  static var catAPIKey: String? {
    ProcessInfo.processInfo.environment["CAT_API_KEY"]
  }
}
