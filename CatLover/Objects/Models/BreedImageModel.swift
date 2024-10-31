//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

struct BreedImageModel: Equatable, Identifiable {

  let id: String
  let url: String
}

// MARK: - Initialize BreedImageData
extension BreedImageModel {

  init(with data: BreedImageData) {
    id = data.id
    url = data.url
  }
}

// MARK: - Initialize BreedImageEntity
extension BreedImageModel {

  init(with data: BreedImageEntity) {
    id = data.breedImageID
    url = data.url
  }
}
