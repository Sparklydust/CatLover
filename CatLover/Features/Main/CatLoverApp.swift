//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftData
import SwiftUI

/// Production code entry point to run the CatLover application.
struct CatLoverApp: App {

  var body: some Scene {
    WindowGroup {
      ContentView()
        .modelContainer(ModelContainer.shared)
    }
  }
}
