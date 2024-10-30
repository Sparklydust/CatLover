//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

struct BreedDetailsView: View {

  let breed: BreedModel
  @State private var breedImages: [String] = [] // Holds URLs for the breed images

  var body: some View {
    ScrollView {
      BreedCard(size: .large, breed: breed)
    }
    .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
  }
}

#Preview {
  BreedDetailsView(breed: .fake())
}
