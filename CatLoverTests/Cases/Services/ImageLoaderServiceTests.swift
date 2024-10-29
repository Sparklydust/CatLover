//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Testing
import UIKit
@testable import CatLover

@Suite(.serialized)
final class ImageLoaderServiceTests: BaseTestCase, @unchecked Sendable {

  var sut: ImageLoaderService!

  override init() {
    super.init()
    sut = ImageLoaderService()
  }

  deinit {
    sut = .none
  }

  @Test func urlStringIsWrongFormat_noneImageIsReturned() async {
    let expected: UIImage? = .none

    let result = await sut.loadImage(urlString: "")

    #expect(result == expected)
  }

  @Test func newImageIsLoadedFromURL_imageIsCachedInImageCachedService() async {
    Container.shared.imageCache.register { self.imageCacheSpy }
    sut = ImageLoaderService()

    _ = await sut.loadImage(urlString: "www.fake.url.com")
    let result = imageCacheSpy.isWriteCalled

    #expect(result == true)
  }

  @Test func imageWasPreviouslyCached_imageIsReturnedFromImageCachedService() async {
    let urlStringFake = "www.fake.url.com"
    imageCacheMock.dataStub[urlStringFake] = UIImage(named: "imBreedFake01")?.pngData()
    Container.shared.imageCache.register { self.imageCacheMock }
    sut = ImageLoaderService()

    let result = await sut.loadImage(urlString: urlStringFake)

    #expect(result != .none)
  }

  @Test func urlSessionThrowsAnErrorWhenRequestingImage_noneImageIsReturned() async {
    urlSessionMock.errorStub = .requestFails
    Container.shared.urlSession.register { self.urlSessionMock }
    Container.shared.imageCache.register { self.imageCacheMock }
    sut = ImageLoaderService()

    let result = await sut.loadImage(urlString: "www.fake.url.com")

    #expect(result == .none)
  }
}
