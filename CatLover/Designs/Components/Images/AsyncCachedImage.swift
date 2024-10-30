//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import SwiftUI

/// A view that asynchronously loads and displays an image from a URL.
struct AsyncCachedImage: View {

  @State private var loader = ImageLoader()
  @State private var opacity: Double = 0.3
  private let urlString: String?

  init(urlString: String?) {
    self.urlString = urlString
  }

  var body: some View {
    ZStack {
      if loader.isLoading {
        ImagePlaceholder()
      } else if let uiImage = loader.uiImage {
        Image(uiImage: uiImage)
          .resizable()
          .scaledToFill()
      } else {
        Image(systemName: "photo")
          .resizable()
          .scaledToFit()
          .foregroundStyle(.gray)
          .scaleEffect(0.6)
      }
    }
    .task { await loader.loadImage(urlString: urlString) }
  }
}

@MainActor @Observable private final class ImageLoader {

  @ObservationIgnored @Injected(\.imageLoader) private var imageLoader
  var uiImage: UIImage?
  var isLoading = false

  func loadImage(urlString: String?) async {
    guard let urlString, !urlString.isEmpty else { return }
    isLoading = true
    uiImage = await imageLoader.loadImage(urlString: urlString)
    isLoading = false
  }
}

#Preview {
  Container.shared.imageLoader.register { ImageLoaderMock() }
  return AsyncCachedImage(urlString: .none)
    .frame(width: 300, height: 300)
}
