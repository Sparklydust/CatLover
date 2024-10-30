//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

struct BreedDetailsView: View {

  let breed: BreedModel

  var body: some View {
    Text(breed.description)
  }
}
