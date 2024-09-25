//
//  ProfileViewTests.swift
//  ImageFeedTests
//
//  Created by Лада on 25.09.2024.
//

@testable import ImageFeed
import XCTest

final class ProfileViewTests: XCTestCase {
    func testViewControllerCallsViewDidLoad() {
        //given
        let profileViewController = ProfileViewController()
        let profileViewPresenter = ProfilePresenterSpy()
        profileViewController.configure(profileViewPresenter)
        
        //when
        _ = profileViewController.view
        
        //then
        XCTAssertTrue(profileViewPresenter.viewDidLoadCalled)
    }
}
