//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Testing
@testable import CatLover

@Suite(.serialized)
final class BreedDetailsViewModelTests: BaseTestCase, @unchecked Sendable {

  var sut: BreedDetailsViewModel!

  override init() {
    super.init()
    sut = BreedDetailsViewModel()
  }

  deinit {
    sut = .none
  }

  // MARK: - Initialization
  @Test func initialization_breedImages_isEqualToEmptyArrayOfBreedImageModel() {
    let expected: [BreedImageModel] = []

    let result = sut.breedImages

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
  @Test func serverRequest_breedImageDataWithSuccess_breedImagesValueIsNotEmpty() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsImagesListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedDetailsViewModel()

    await sut.getBreedImages(for: BreedModel.fake().id, atPage: .zero)
    let result = sut.breedImages.isEmpty

    #expect(result == false)
  }

  @MainActor
  @Test func serverRequest_breedImageDataWithError_breedImagesValueIsEmpty() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedDetailsViewModel()

    await sut.getBreedImages(for: BreedModel.fake().id, atPage: .zero)
    let result = sut.breedImages.isEmpty

    #expect(result == true)
  }

  @MainActor
  @Test func serverRequest_startsRequestingData_isLoadingIsTrue() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsImagesListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedDetailsViewModel()

    serverMock.onPerformAsyncAwait = {
      let result = self.sut.isLoading

      #expect(result == true)
    }
    await sut.getBreedImages(for: BreedModel.fake().id, atPage: .zero)
  }

  @MainActor
  @Test func serverRequest_finishRequestingDataWithSuccess_isLoadingIsFalse() async throws {
    serverMock = try FakeFactory.serverMock(data: .breedsImagesListData)
    Container.shared.server.register { self.serverMock }
    sut = BreedDetailsViewModel()

    await sut.getBreedImages(for: BreedModel.fake().id, atPage: .zero)
    let result = sut.isLoading

    #expect(result == false)
  }

  @MainActor
  @Test func serverRequest_finishRequestingDataWithError_isLoadingIsFalse() async throws {
    serverMock = try FakeFactory.serverMock(error: .requestFails)
    Container.shared.server.register { self.serverMock }
    sut = BreedDetailsViewModel()

    await sut.getBreedImages(for: BreedModel.fake().id, atPage: .zero)
    let result = sut.isLoading

    #expect(result == false)
  }
}
