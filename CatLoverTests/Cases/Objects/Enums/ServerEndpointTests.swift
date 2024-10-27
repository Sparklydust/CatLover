//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation
import Testing
@testable import CatLover

struct ServerEndpointTests {

  @Test func urlEndpointToGetCatBreedsList() throws {
    let expected = URL(string: "https://api.thecatapi.com/v1/breeds")

    let result = ServerEndpoint.breedsList.url

    #expect(result == expected)
  }
}
