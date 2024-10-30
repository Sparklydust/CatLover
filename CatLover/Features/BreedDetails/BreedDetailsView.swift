//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import SwiftUI

struct BreedDetailsView: View {

  let breed: BreedModel

  var body: some View {
    ScrollView {
      BreedCard(size: .large, breed: breed)

      Text(L10n.breedDetailsGallery)
        .font(.title2)
        .foregroundStyle(.primary)
        .fontWeight(.medium)
    }
    .navigationTitle(L10n.breedDetailsNavBarTitle)
    .navigationBarTitleDisplayMode(.inline)
    .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
  }
}

#Preview {
  let serverMock = try! FakeFactory.serverMock(data: .breedsImagesListData)
  Container.shared.server.register { serverMock }
  return BreedDetailsView(breed: .fake())
}
