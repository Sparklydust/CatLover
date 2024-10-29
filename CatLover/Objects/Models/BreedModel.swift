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
