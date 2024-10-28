//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

/// Load resources directly from the main bundle in the iOS project.
struct ResourceLoader {

  /// Retrieve the JSON file from the `Resources/Jsons` folder.
  /// - Parameter named: The name of the JSON file to decode.
  /// - Returns: The JSON model as data.
  static func jsonFake(_ named: JsonFileName) throws -> Data {
    if let bundleURL = Bundle.main.url(forResource: named.rawValue, withExtension: "json") {
      return try Data(contentsOf: bundleURL)
    } else {
      throw URLError(.fileDoesNotExist, userInfo: [NSLocalizedDescriptionKey: "`\(named.rawValue).json` was expected in the `Resources/Jsons` folder but was not found."])
    }
  }
}
