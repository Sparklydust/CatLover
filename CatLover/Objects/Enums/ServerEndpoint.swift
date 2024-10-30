//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

enum ServerEndpoint {

  private static let baseURL: String = "https://api.thecatapi.com/v1"

  case breedImages(breedID: String, page: Int, limitPerPage: Int)
  case breedsList

  var url: URL? {
    switch self {
    case .breedImages(let breedID, let page, let limitPerPage):
      URL(string: "\(ServerEndpoint.baseURL)/images/search?size=small&mime_types=jpg&format=json&breed_ids=\(breedID)&order=ASC&page=\(page)&limit=\(limitPerPage)")
    case .breedsList:
      URL(string: "\(ServerEndpoint.baseURL)/breeds")
    }
  }
}
