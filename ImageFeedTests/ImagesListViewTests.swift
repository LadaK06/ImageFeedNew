//
//  ImagesListViewTests.swift
//  ImageFeedTests
//
//  Created by Лада on 25.09.2024.
//


@testable import ImageFeed
import XCTest

final class ImagesListViewTests: XCTestCase {
    func testImagesListViewControllerCallsViewDidLoad() {
        //given
        let imagesListViewController = ImagesListViewController()
        let imagesListViewPresenter = ImagesListViewPresenterSpy()
        imagesListViewController.configure(imagesListViewPresenter)
        
        //when
        imagesListViewController.updateImagesListDetails()
        
        //then
        XCTAssertTrue(imagesListViewPresenter.updateIsCalled)
    }
}
