//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import UIKit

final class ImageLoaderMock: ImageLoaderProtocol, @unchecked Sendable {

  // Mock values
  var imageStub: UIImage?

  // Protocol requirements
  func loadImage(urlString: String) async -> UIImage? {
    imageStub
  }
}
