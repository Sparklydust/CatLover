//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

struct GalleryUnavailableView: View {

  var body: some View {
    ContentUnavailableView(
      L10n.serverErrorBreedDetailsFailureTitle,
      systemImage: "wifi.exclamationmark",
      description: Text(L10n.serverErrorBreedDetailsFailureMessage)
    )
  }
}

#Preview {
  GalleryUnavailableView()
}
