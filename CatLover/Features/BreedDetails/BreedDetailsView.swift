//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import SwiftUI

struct BreedDetailsView: View {

  @State private var vm = BreedDetailsViewModel()

  private let columns = [GridItem(.flexible()), GridItem(.flexible())]

  let breed: BreedModel

  var body: some View {
    ScrollView {
      BreedCard(size: .large, breed: breed)

      Text(L10n.breedDetailsGallery)
        .font(.title2)
        .foregroundStyle(.primary)
        .fontWeight(.medium)
        .padding(.top)

      VStack {
        LazyVGrid(columns: columns, spacing: 8) {
          ForEach(vm.breedImages, id: \.id) { image in
            AsyncCachedImage(urlString: image.url)
              .task {
                guard image.id == vm.breedImages.last?.id else { return }
                await vm.getBreedImages(for: breed.id)
              }
          }
        }
        .padding(.horizontal)

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
