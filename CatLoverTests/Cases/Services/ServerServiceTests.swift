//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Testing
@testable import CatLover

@Suite(.serialized)
final class ServerServiceTests: BaseTestCase, @unchecked Sendable {

  var sut: ServerService!

  override init() {
    super.init()
    sut = ServerService()
  }

  deinit {
    sut = .none
  }

  @Test func requestIsSuccessful_requestedDataIsReturned() async throws {
    urlSessionMock = try TestTool.urlSessionMock(data: .breedsListData)
    Container.shared.urlSession.register { self.urlSessionMock }
    let expected: [BreedData] = [
      .fake(),
      .fake(
        id: "aege",
        name: "Aegean",
        origin: "Greece",
        temperament: "Affectionate, Social",
        description: "Native to the Greek islands known as the Cyclades in the Aegean Sea.",
        lifeSpan: "9 - 12",
        image: .fake(url: "imBreedFake02")
      )
    ]
    sut = ServerService()

    let result = try await sut.get([BreedData].self, atEndpoint: .breedsList)

    #expect(result == expected)
  }

  @Test func requestIsNoSuccessful_serverErrorIsReturned() async throws {
    #expect(false == true, "Test not yet implemented")
  }
}
