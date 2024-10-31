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
  @Test func initialization_filteredBreeds_isEqualToEmptyArrayOfBreedModel() {
    let expected: [BreedModel] = []

    let result = sut.filteredBreeds

    #expect(result == expected)
  }

  @Test func initialization_isLoading_isFalse() {
    let result = sut.isLoading

    #expect(result == false)
  }

  @Test func initialization_showConnectionError_isFalse() {
    let result = sut.showConnectionError

    #expect(result == false)
  }

  @Test func initialization_showAPIKeyError_isFalse() {
    let result = sut.showAPIKeyError

    #expect(result == false)
  }

  @Test func initialization_searchText_isEqualToEmptyString() {
    let expected = String()

    let result = sut.searchText

    #expect(result == expected)
  }

  // MARK: - Search
  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func initialization_noSearchText_returnsAllBreeds() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()
    await sut.getBreeds()
    let expected = 2

    sut.searchText = String()
    let result = sut.filteredBreeds.count

    #expect(result == expected)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func initialization_withSearchText_returnsMatchingBreeds() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()
    await sut.getBreeds()
    let expected = "Aegean"

    sut.searchText = "aeg"
    let result = try #require(sut.filteredBreeds.first?.name)

    #expect(result == expected)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func initialization_withSearchText_noMatchingBreeds() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()
    await sut.getBreeds()

    sut.searchText = "xyz"
    let result = sut.filteredBreeds.isEmpty

    #expect(result == true)
  }

  // MARK: - Server Request
  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_breedsDataWithSuccess_filteredBreedsValueIsNotEmpty() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.filteredBreeds.isEmpty

    #expect(result == false)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_breedsDataWithError_filteredBreedsValueIsEmpty() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.filteredBreeds.isEmpty

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
  func serverRequest_failsWithSavedBreedEntityDataEmpty_filteredBreedsValueIsEmpty() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.filteredBreeds.isEmpty

    #expect(result == true)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_failsWithSavedBreedEntityDataEmpty_showConnectionErrorValueIsTrue() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.showConnectionError

    #expect(result == true)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_failsWithMissingAPIKey_showConnectionErrorValueIsTrue() async throws {
    serverMock = try FakeFactory.serverMock(error: .apiKeyMissing)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.showAPIKeyError

    #expect(result == true)
  }

  @MainActor
  @Test(.disabled("Unresolved SwiftData in-memory container limitations in test environment."))
  func serverRequest_failsWithBreedEntitySavedDataNotEmpty_filteredBreedsValueIsNotEmpty() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()
    BreedEntity.modelContext.insert(BreedEntity.fake())

    await sut.getBreeds()
    let result = sut.filteredBreeds.isEmpty

    #expect(result == false)
  }
}
