//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

/// A cell view that displays a cat breed's information.
struct BreedCard: View {

  @Environment(\.colorScheme) private var colorScheme

  let breed: BreedModel

  var body: some View {
    HStack(alignment: .top, spacing: 12) {
      VStack {
        AsyncCachedImage(urlString: breed.imageURL)
          .frame(width: 80, height: 80)
          .shadow(radius: 4)
      }

      VStack(alignment: .leading, spacing: 6) {
        Text(breed.name)
          .font(.headline)
          .foregroundColor(.accentColor)

        Text(breed.origin)
          .font(.subheadline)
          .foregroundColor(.secondary)

        Text(breed.temperament)
          .font(.footnote)
          .foregroundColor(.secondary)
          .lineLimit(1)
          .truncationMode(.tail)

        Text(breed.description)
          .font(.caption)
          .foregroundColor(.gray)
          .lineLimit(2)
          .multilineTextAlignment(.leading)
          .truncationMode(.tail)
      }

      Spacer()
    }
    .padding()
    .background(colorScheme == .light ? Color(.systemBackground) : .clear)
    .background(colorScheme == .dark ? .ultraThinMaterial : .regular)
    .cornerRadius(12)
    .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
    .padding(.horizontal, 16)
    .padding(.vertical, 8)
  }
}

#Preview {
  BreedCard(breed: .fake())
}
