//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

struct BreedData: Codable, Equatable {

  let id: String
  let name: String
  let origin: String
  let temperament: String
  let description: String
  let lifeSpan: String
  let image: ImageData?

  struct ImageData: Codable, Equatable {
    let url: String
  }

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case origin
    case temperament
    case description
    case lifeSpan = "life_span"
    case image
  }
}
