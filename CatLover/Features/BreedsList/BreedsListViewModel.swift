//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

@Observable final class BreedsListViewModel {

  var breeds: [BreedModel] = []
  var isLoading = false
  var showError = false
}
