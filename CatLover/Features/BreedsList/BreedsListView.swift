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
          ForEach(vm.filteredBreeds, id: \.id) { breed in
            NavigationLink {
              BreedDetailsView(breed: breed)
            } label: {
              BreedCard(size: .medium, breed: breed)
            }
          }
        }
      }
      .navigationTitle(L10n.breedsListNavBarTitle)
      .searchable(text: $vm.searchText)
    }
    .firstTask { await vm.getBreeds() }
    .overlay { if vm.isLoading { LTProgressView() }}
  }
}

#Preview {
  let serverMock = try! FakeFactory.serverMock(data: .breedsListData)
  Container.shared.server.register { serverMock }
  return BreedsListView()
    .modelContainer(try! BreedEntity.fakeContainer())
}
