//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

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
    #expect(false == true, "Test not yet implemented.")
  }

  @Test func initialization_isLoading_isFalse() {
    #expect(false == true, "Test not yet implemented.")
  }

  @Test func initialization_showError_isFalse() {
    #expect(false == true, "Test not yet implemented.")
  }

  // MARK: - Server Request
  @Test func serverRequest_breedsDataWithSuccess_breedsValueIsNotEmpty() {
    #expect(false == true, "Test not yet implemented.")
  }

  @Test func serverRequest_breedsDataWithError_breedsValueIsEmpty() {
    #expect(false == true, "Test not yet implemented.")
  }

  @Test func serverRequest_startsRequestingData_isLoadingIsTrue() {
    #expect(false == true, "Test not yet implemented.")
  }

  @Test func serverRequest_finishRequestingDataWithSuccess_isLoadingIsFalse() {
    #expect(false == true, "Test not yet implemented.")
  }

  @Test func serverRequest_finishRequestingDataWithError_isLoadingIsFalse() {
    #expect(false == true, "Test not yet implemented.")
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
