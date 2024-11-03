//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

extension View {

  /// Adds alerts to display errors on the breeds list view.
  /// - Parameters:
  ///   - showAPIKeyError: Control the display of the API key error alert.
  ///   - showConnectionError: Control the display of the connection error alert.
  func breedsListAlert(
    showAPIKeyError: Binding<Bool>,
    showConnectionError: Binding<Bool>
  ) -> some View {
    modifier(
      breedsListAlertModifier(
        showAPIKeyError: showAPIKeyError,
        showConnectionError: showConnectionError
      )
    )
  }
}

private struct breedsListAlertModifier: ViewModifier {

  @Binding var showAPIKeyError: Bool
  @Binding var showConnectionError: Bool

  func body(content: Content) -> some View {
    content
      .alert(
        L10n.serverErrorAPIKeyMissingTitle,
        isPresented: $showAPIKeyError,
        actions: {},
        message: { Text(L10n.serverErrorAPIKeyMissingMessage) }
      )
      .alert(
        L10n.serverErrorBreedsListFailureTitle,
        isPresented: $showConnectionError,
        actions: {},
        message: { Text(L10n.serverErrorBreedsListFailureMessage) }
      )
  }
}
