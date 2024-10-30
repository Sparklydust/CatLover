//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import UIKit

/// Protocol defining an interface for loading images from a URL.
protocol ImageLoaderProtocol: Sendable {

  /// Loads an image from the specified URL string.
  /// - Parameter urlString: The URL string of the image to load.
  /// - Returns: An optional ``UIImage`` if the image was successfully loaded; otherwise, `nil`.
  func loadImage(urlString: String?) async -> UIImage?
}
