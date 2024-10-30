//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

/// Custom progress view.
struct CLProgressView: View {

  enum SizeType { case medium, large }

  var size: SizeType

  var body: some View {
    ProgressView()
      .scaleEffect(size == .medium ? 1.2 : 1.6)
      .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
  }
}

#Preview {
  CLProgressView(size: .medium)
}

#Preview {
  CLProgressView(size: .large)
}
