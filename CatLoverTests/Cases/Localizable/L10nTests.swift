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

  @Test func breedDetailsNavBarTitle_returnsAssociatedTranslation() {
    let expected = "Breed Details"

    let result = L10n.breedDetailsNavBarTitle

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func breedsListNavBarTitle_returnsAssociatedTranslation() {
    let expected = "Cat Breeds"

    let result = L10n.breedsListNavBarTitle

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func serverErrorAPIKeyMissingMessage_returnsAssociatedTranslation() {
    let expected = "A valid Cat API Key is required for server requests. Please add it as an environment variable in Xcode."

    let result = L10n.serverErrorAPIKeyMissingMessage

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func serverErrorAPIKeyMissingTitle_returnsAssociatedTranslation() {
    let expected = "Cat API Key Missing"

    let result = L10n.serverErrorAPIKeyMissingTitle

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func serverErrorBreedDetailsFailureMessage_returnsAssociatedTranslation() {
    let expected = "The image gallery could not be loaded because your device is offline. Connect to the internet to view images for this breed."

    let result = L10n.serverErrorBreedDetailsFailureMessage

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func serverErrorBreedDetailsFailureTitle_returnsAssociatedTranslation() {
    let expected = "Images Unavailable"

    let result = L10n.serverErrorBreedDetailsFailureTitle

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func serverErrorBreedsListFailureMessage_returnsAssociatedTranslation() {
    let expected = "We couldn’t load the breed list because your device is offline. Please check your connection and try again."

    let result = L10n.serverErrorBreedsListFailureMessage

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }

  @Test func serverErrorBreedsListFailureTitle_returnsAssociatedTranslation() {
    let expected = "Connection Unavailable"

    let result = L10n.serverErrorBreedsListFailureTitle

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }
}
