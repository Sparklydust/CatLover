//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import SwiftData
import Testing
@testable import CatLover

@Suite(.serialized)
final class BreedsListViewModelsTests: BaseTestCase, @unchecked Sendable {

  var sut: BreedsListViewModel!

  override init() {
    super.init()
    sut = BreedsListViewModel()
  }

  deinit {
    sut = .none
  }

  // MARK: - Initialization
  @Test func initialization_breeds_isEqualToEmptyArrayOfBreedModel() {
    let expected: [BreedModel] = []

    let result = sut.breeds

    #expect(result == expected)
  }

  @Test func initialization_isLoading_isFalse() {
    let result = sut.isLoading

    #expect(result == false)
  }

  @Test func initialization_showError_isFalse() {
    let result = sut.showError

    #expect(result == false)
  }

  // MARK: - Server Request
  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_breedsDataWithSuccess_breedsValueIsNotEmpty() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.breeds.isEmpty

    #expect(result == false)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_breedsDataWithError_breedsValueIsEmpty() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.breeds.isEmpty

    #expect(result == true)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_startsRequestingData_isLoadingIsTrue() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    serverMock.onPerformAsyncAwait = {
      let result = self.sut.isLoading

      #expect(result == true)
    }
    await sut.getBreeds()
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_finishRequestingDataWithSuccess_isLoadingIsFalse() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.isLoading

    #expect(result == false)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_finishRequestingDataWithError_isLoadingIsFalse() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.isLoading

    #expect(result == false)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_isSuccessful_dataAreSavedWithinBreedEntity() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()
    let fetchRequest = FetchDescriptor<BreedEntity>()

    await sut.getBreeds()
    let result = try? BreedEntity.modelContext.fetch(fetchRequest).isEmpty

    #expect(result == false)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_failsWithSavedBreedEntityDataEmpty_breedsValueIsEmpty() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.breeds.isEmpty

    #expect(result == true)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_failsWithSavedBreedEntityDataEmpty_showErrorValueIsTrue() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.showError

    #expect(result == true)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_failsWithBreedEntitySavedDataNotEmpty_breedsValueIsNotEmpty() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()
    BreedEntity.modelContext.insert(BreedEntity.fake())

    await sut.getBreeds()
    let result = sut.breeds.isEmpty

    #expect(result == false)
  }
}
