//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Testing
@testable import CatLover

@Suite(.serialized)
final class BreedDetailsViewModelTests: BaseTestCase, @unchecked Sendable {

  var sut: BreedDetailsViewModel!

  override init() {
    super.init()
    sut = BreedDetailsViewModel()
  }

  deinit {
    sut = .none
  }

  // MARK: - Initialization
  @Test func initialization_breedImages_isEqualToEmptyArrayOfBreedImageModel() {
    let expected: [BreedImageModel] = []

    let result = sut.breedImages

    #expect(result == expected)
  }

  @Test func initialization_isLoading_isFalse() {
    let result = sut.isLoading

    #expect(result == false)
  }

  @Test func initialization_showError_isFalse() {
    let result = sut.showError

    #expect(result == false)
  }
}
