//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

/// A pulsing gray rectangle used as a placeholder during image loading.
struct ImagePlaceholder: View {

  @State private var opacity = 0.3

  var body: some View {
    Rectangle()
      .foregroundColor(.gray.opacity(opacity))
      .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: opacity)
      .onAppear { opacity = 0.6 }
  }
}

#Preview {
  ImagePlaceholder()
    .frame(width: 300, height: 300)
}
