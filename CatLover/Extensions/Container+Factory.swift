//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation

extension Container {

  var server: Factory<any ServerProtocol> {
    self { ServerService() }
  }

  var urlSession: Factory<any URLSessionProtocol> {
    self { URLSession.shared }
  }
}
