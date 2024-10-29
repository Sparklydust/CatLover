//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import UIKit

final class ImageLoaderSpy: ImageLoaderProtocol, @unchecked Sendable {

  // Spy values
  var loadImageIsCalled = false
  var urlString: String?

  // Protocol requirements
  func loadImage(urlString: String) async -> UIImage? {
    loadImageIsCalled = true
    self.urlString = urlString
    return .none
  }
}
