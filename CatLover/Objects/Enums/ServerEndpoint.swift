//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

enum ServerEndpoint {

  private static let baseURL: String = "https://api.thecatapi.com/v1"

  case breedImages(page: Int)
  case breedsList

  var url: URL? {
    switch self {
    case .breedImages(let page): URL(string: "\(ServerEndpoint.baseURL)/images/search?size=med&mime_types=jpg&format=json&has_breeds=true&order=ASC&page=\(page)&limit=15")
    case .breedsList: URL(string: "\(ServerEndpoint.baseURL)/breeds")
    }
  }
}
