//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class URLSessionDummy: URLSessionProtocol {

  // Protocol requirements
  func data(
    from url: URL,
    delegate: (any URLSessionTaskDelegate)?)
  async throws -> (Data, URLResponse) {
    (Data(), URLResponse())
  }
}
