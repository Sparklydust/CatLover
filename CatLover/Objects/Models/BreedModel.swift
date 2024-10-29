//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

struct BreedModel: Equatable {

  let id: String
  let name: String
  let origin: String
  let temperament: String
  let description: String
  let lifeSpan: String
  let imageURL: String?
}

// MARK: - Initialize BreedData
extension BreedModel {

  init(with data: BreedData) {
    id = data.id
    name = data.name
    origin = data.origin
    temperament = data.temperament
    description = data.description
    lifeSpan = data.lifeSpan
    imageURL = data.image?.url
  }
}


// MARK: - Initialize BreedEntity
extension BreedModel {

  init(with data: BreedEntity) {
    id = data.breedID
    name = data.name
    origin = data.origin
    temperament = data.temperament
    description = data.info
    lifeSpan = data.lifeSpan
    imageURL = data.imageURL
  }
}
