//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

extension Bundle {

  /// Retrieves the CatLover API key from the Info.plist file to access the API key required for
  /// network requests to TheCatAPI.
  ///
  /// You can obtain an API key from TheCatAPI by visiting [TheCatAPI](https://thecatapi.com)
  /// - Warning: Ensure the `CAT_API_KEY` value is set in your Info.plist file.
  var catAPIKey: String? {
    guard NSClassFromString("XCTestCase") == .none
    else { return ProcessInfo.processInfo.environment["CAT_API_KEY"] }
    return object(forInfoDictionaryKey: "CAT_API_KEY") as? String
  }
}
