//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import UIKit

final class ImageLoaderDummy: ImageLoaderProtocol {

  // Protocol requirements
  func loadImage(urlString: String?) async -> UIImage? {
    .none
  }
}
