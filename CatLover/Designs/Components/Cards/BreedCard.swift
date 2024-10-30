//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

/// A cell view that displays a cat breed's information.
struct BreedCard: View {

  @Environment(\.colorScheme) private var colorScheme

  enum SizeType { case medium, large }

  let size: SizeType
  let breed: BreedModel

  var body: some View {
    VStack {
      if size == .medium {
        HStack(alignment: .top, spacing: 12) {
          AsyncCachedImage(urlString: breed.imageURL)
            .frame(width: 80, height: 80)
            .cornerRadius(12)
            .shadow(radius: 4)

          mainLayout

          Spacer()
        }
      } else {
        VStack(alignment: .center, spacing: 12) {
          AsyncCachedImage(urlString: breed.imageURL)
            .frame(height: 200)
            .cornerRadius(12)
            .shadow(radius: 4)

          mainLayout
        }
      }
    }
    .padding()
    .background(colorScheme == .light ? Color(.systemBackground) : .clear)
    .background(colorScheme == .dark ? .ultraThinMaterial : .regular)
    .cornerRadius(size == .medium ? 12 : 15)
    .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
    .padding(.horizontal, size == .medium ? 16 : 12)
    .padding(.vertical, size == .medium ? 8 : 12)
  }
}

// MARK: - Main Layout
extension BreedCard {

  var mainLayout: some View {
    VStack(
      alignment: .leading,
      spacing: size == .medium ? 6 : 8
    ) {
      Text(breed.name)
        .font(size == .medium ? .headline : .largeTitle)
        .fontWeight(size == .medium ? .regular : .bold)
        .foregroundColor(.accentColor)

      Text(
        size == .medium
        ? breed.origin
        : L10n.breedDetailsOrigin + breed.origin
      )
      .font(.subheadline)
      .foregroundColor(.secondary)

      Text(
        size == .medium
        ? breed.temperament
        : L10n.breedDetailsTemperament + breed.temperament
      )
      .font(.footnote)
      .foregroundColor(.secondary)
      .lineLimit(size == .medium ? 1 : nil)
      .truncationMode(.tail)

      if size == .large {
        Text(L10n.breedDetailsLifespan + breed.lifeSpan)
          .font(.footnote)
          .foregroundColor(.secondary)
          .padding(.top, 4)
      }

      Text(breed.description)
        .font(size == .medium ? .caption : .body)
        .foregroundColor(size == .medium ? .gray : .primary)
        .multilineTextAlignment(.leading)
        .lineLimit(size == .medium ? 2 : nil)
        .truncationMode(.tail)
    }
  }
}

#Preview("Medium Size") {
  BreedCard(size: .medium, breed: .fake())
}

#Preview("Large Size") {
  BreedCard(size: .large, breed: .fake())
}
