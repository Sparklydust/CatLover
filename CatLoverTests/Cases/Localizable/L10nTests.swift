//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

struct L10nTests {

  @Test func breedDetailsGallery_returnsAssociatedTranslation() {
    let expected = "Gallery"

    let result = L10n.breedDetailsGallery

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func breedDetailsLifespan_returnsAssociatedTranslation() {
    let expected = "Lifespan: %@ years"

    let result = L10n.breedDetailsLifespan

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func breedDetailsOrigin_returnsAssociatedTranslation() {
    let expected = "Origin: "

    let result = L10n.breedDetailsOrigin

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func breedDetailsTemperament_returnsAssociatedTranslation() {
    let expected = "Temperament: "

    let result = L10n.breedDetailsTemperament

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func breedsListNavBarTitle_returnsAssociatedTranslation() {
    let expected = "Cat Breeds"

    let result = L10n.breedsListNavBarTitle

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }
}
