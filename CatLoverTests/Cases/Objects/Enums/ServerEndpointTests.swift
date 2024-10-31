//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation
import Testing
@testable import CatLover

struct ServerEndpointTests {

  @Test func urlEndpointToGetBreedImages() {
    let expected = URL(string: "https://api.thecatapi.com/v1/images/search?size=med&mime_types=jpg&format=json&breed_ids=123-abc&order=ASC&page=1&limit=15")

    let result = ServerEndpoint.breedImages(breedID: "123-abc", page: 1, limitPerPage: 15).url

    #expect(result == expected)
  }

  @Test func urlEndpointToGetCatBreedsList() {
    let expected = URL(string: "https://api.thecatapi.com/v1/breeds")

    let result = ServerEndpoint.breedsList.url

    #expect(result == expected)
  }
}
