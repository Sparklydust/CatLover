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
      var components = URLComponents(string: "\(ServerEndpoint.baseURL)/images/search")
      components?.queryItems = [
        URLQueryItem(name: "size", value: "med"),
        URLQueryItem(name: "mime_types", value: "jpg"),
        URLQueryItem(name: "format", value: "json"),
        URLQueryItem(name: "breed_ids", value: breedID),
        URLQueryItem(name: "order", value: "ASC"),
        URLQueryItem(name: "page", value: String(page)),
        URLQueryItem(name: "limit", value: String(limitPerPage))
      ]
      return components?.url
    case .breedsList:
      return URL(string: "\(ServerEndpoint.baseURL)/breeds")
    }
  }
}
