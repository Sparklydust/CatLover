//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

extension BreedData {

  /// Create fake ``BreedData`` object for unit tests.
  /// Returns: Initialized object with fake data.
  static func fake(
    id: String = "abys",
    name: String = "Abyssinian",
    origin: String = "Egypt",
    temperament: String = "Active, Energetic, Independent, Intelligent, Gentle",
    description: String = "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
    lifeSpan: String = "14 - 15",
    image: BreedData.ImageData = .fake()
  ) -> BreedData {
    .init(
      id: id,
      name: name,
      origin: origin,
      temperament: temperament,
      description: description,
      lifeSpan: lifeSpan,
      image: image
    )
  }
}

extension BreedData.ImageData {

  /// Create fake ``BreedData.ImageData`` object for unit tests.
  /// Returns: Initialized object with fake data.
  static func fake(
    url: String = "imBreedFake01"
  ) -> BreedData.ImageData {
    .init(
      url: url
    )
  }
}
