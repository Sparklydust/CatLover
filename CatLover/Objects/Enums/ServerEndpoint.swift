//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

enum ServerEndpoint {

  case breedsList

  var url: URL? {
    switch self {
    case .breedsList: URL(string: "https://api.thecatapi.com/v1/breeds")
    }
  }
}
