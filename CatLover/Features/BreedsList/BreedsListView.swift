//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import SwiftUI

struct BreedsListView: View {

  @State private var vm = BreedsListViewModel()

  var body: some View {
    NavigationStack {
      Image(.launchScreenV1)
        .navigationTitle(L10n.breedsListNavBarTitle)
    }
  }
}

#Preview {
  let serverMock = try! FakeFactory.serverMock(data: .breedsListData)
  Container.shared.server.register { serverMock }
  return BreedsListView()
    .modelContainer(try! BreedEntity.fakeContainer())
}
