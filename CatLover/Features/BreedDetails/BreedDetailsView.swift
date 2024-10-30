//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import SwiftUI

struct BreedDetailsView: View {

  @State private var vm = BreedDetailsViewModel()

  let breed: BreedModel

  var body: some View {
    ScrollView {
      BreedCard(size: .large, breed: breed)

      Text(L10n.breedDetailsGallery)
        .font(.title2)
        .foregroundStyle(.primary)
        .fontWeight(.medium)

      LazyVStack {
        ForEach(vm.breedImages, id: \.id) { image in
          Text(image.imageURL)
            .task {
              guard image.id == vm.breedImages.last?.id else { return }
              await vm.getBreedImages(for: breed.id)
            }
        }

        if vm.isLoading {
          CLProgressView(size: .medium)
            .padding(.vertical)
        }
      }
    }
    .navigationTitle(L10n.breedDetailsNavBarTitle)
    .navigationBarTitleDisplayMode(.inline)
    .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    .task { await vm.getBreedImages(for: breed.id) }
  }
}

#Preview {
  let serverMock = try! FakeFactory.serverMock(data: .breedsImagesListData)
  Container.shared.server.register { serverMock }
  return BreedDetailsView(breed: .fake())
}
