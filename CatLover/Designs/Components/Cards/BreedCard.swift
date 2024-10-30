//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

/// A cell view that displays a cat breed's information.
struct BreedCard: View {

  let breed: BreedModel

  var body: some View {
    HStack(alignment: .top, spacing: 12) {
      AsyncCachedImage(urlString: breed.imageURL)
        .frame(width: 80, height: 80)
        .cornerRadius(10)
        .shadow(radius: 4)

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
          .truncationMode(.tail)
      }
      .padding(.vertical, 8)

      Spacer()
    }
    .padding()
    .background(Color(.systemBackground))
    .cornerRadius(12)
    .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
  }
}

#Preview {
  BreedCard(breed: .fake())
}
