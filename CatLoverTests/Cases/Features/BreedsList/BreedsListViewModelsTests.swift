//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

@Suite(.serialized)
final class BreedsListViewModelsTests: BaseTestCase, @unchecked Sendable {

  var sut: BreedsListViewModel!

  override init() {
    super.init()
    sut = BreedsListViewModel()
  }

  deinit {
    sut = .none
  }
}
