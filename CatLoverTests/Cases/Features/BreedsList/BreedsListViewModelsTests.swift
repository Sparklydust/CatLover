//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
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
  @Test func serverRequest_breedsDataWithSuccess_breedsValueIsNotEmpty() async throws {
    serverMock = try TestTool.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.breeds.isEmpty

    #expect(result == false)
  }

  @Test func serverRequest_breedsDataWithError_breedsValueIsEmpty() async throws {
    serverMock = try TestTool.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.breeds.isEmpty

    #expect(result == true)
  }

  @Test func serverRequest_startsRequestingData_isLoadingIsTrue() async throws {
    serverMock = try TestTool.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    serverMock.onPerformAsyncAwait = {
      let result = self.sut.isLoading

      #expect(result == true)
    }
    await sut.getBreeds()
  }

  @Test func serverRequest_finishRequestingDataWithSuccess_isLoadingIsFalse() async throws {
    serverMock = try TestTool.serverMock(data: .breedsListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.isLoading

    #expect(result == false)
  }

  @Test func serverRequest_finishRequestingDataWithError_isLoadingIsFalse() async throws {
    serverMock = try TestTool.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedsListViewModel()

    await sut.getBreeds()
    let result = sut.isLoading

    #expect(result == false)
  }

  @Test func serverRequest_isSuccessful_dataAreSavedWithinBreedEntity() {
    #expect(false == true, "Test not yet implemented.")
  }

  @Test func serverRequest_failsWithSavedBreedEntityDataEmpty_breedsValueIsEmpty() {
    #expect(false == true, "Test not yet implemented.")
  }

  @Test func serverRequest_failsWithBreedEntitySavedDataNotEmpty_breedsValueIsNotEmpty() {
    #expect(false == true, "Test not yet implemented.")
  }

  // MARK: - Image Loader
  @Test func imageLoader_requestAnImage_imageLoaderIsCalled() {
    #expect(false == true, "Test not yet implemented.")
  }

  @Test func imageLoader_requestAnImageIsSuccessful_imageIsReturned() {
    #expect(false == true, "Test not yet implemented.")
  }

  @Test func imageLoader_requestAnImageFails_nilIsReturned() {
    #expect(false == true, "Test not yet implemented.")
  }
}
