//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

/// Custom progress view.
struct LTProgressView: View {

  var body: some View {
    ProgressView()
      .scaleEffect(1.6)
      .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
  }
}

#Preview {
  LTProgressView()
}
