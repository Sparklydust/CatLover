//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

/// Main entry point at the CatLoverApp application startup.
///
/// CatLoverAppMain check if the application is running tests to bypass the normal CatLoverApp and
/// run the ``CatLoverAppTests`` instead to take control of the Application launch and avoid
/// running instances when initialized.
@main
struct CatLoverMain {

  static func main() throws {
    guard NSClassFromString("XCTestCase") == .none else {
      CatLoverAppTests.main()
      return
    }
    CatLoverApp.main()
  }
}
