//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftUI

/// Unit Testing entry point to run the CatLover application.
///
/// This struct is used when triggering the system under tests and not in production, which
/// would bypass the ``CatLoverApp`` application entry point.
struct CatLoverAppTests: App {

  var body: some Scene {
    WindowGroup { EmptyView() }
  }
}
