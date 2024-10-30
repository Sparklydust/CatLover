//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

struct L10nTests {

  func breedsListNavBarTitle_returnsAssociatedTranslation() {
    let expected = "Cat Breeds"

    let result = L10n.breedsListNavBarTitle

    #expect(result == expected, "Translation must match the one in the associated `Localizable` table file.")
  }
}
