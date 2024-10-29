//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation
import SwiftData

@Model final class BreedEntity {

  @Attribute(.unique) var breedID: String

  init(with data: BreedData) {
    self.breedID = data.id
  }
}
