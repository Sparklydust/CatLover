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
    sut = ServerService()
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

    let result = try await sut.get([BreedData].self, atEndpoint: .breedsList)

    #expect(result == expected)
  }

  @Test func requestIsNotSuccessful_serverErrorIsReturned() async throws {
    urlSessionMock = try TestTool.urlSessionMock(error: .requestFails)
    Container.shared.urlSession.register { self.urlSessionMock }
    sut = ServerService()

    await #expect(throws: ServerError.requestFails) {
      _ = try await sut.get([BreedData].self, atEndpoint: .breedsList)
    }
  }
}
