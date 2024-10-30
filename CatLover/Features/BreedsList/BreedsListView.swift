//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import SwiftUI

struct BreedsListView: View {

  @State private var vm = BreedsListViewModel()

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack {
          ForEach(vm.breeds, id: \.id) { breed in
            HStack {
              BreedCard(breed: breed)
                .padding(.horizontal)
            }
          }
        }
      }
      .navigationTitle(L10n.breedsListNavBarTitle)
    }
    .task { await vm.getBreeds() }
  }
}

#Preview {
  let serverMock = try! FakeFactory.serverMock(data: .breedsListData)
  Container.shared.server.register { serverMock }
  return BreedsListView()
    .modelContainer(try! BreedEntity.fakeContainer())
}
