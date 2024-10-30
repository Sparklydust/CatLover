//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

struct BreedImageModel: Equatable, Identifiable {

  let id: String
  let url: String

  init(with data: BreedImageData) {
    id = data.id
    url = data.url
  }
}
