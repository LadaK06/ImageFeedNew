//
//  ProfilePresenterSpy.swift
//  ImageFeedTests
//
//  Created by Лада on 25.09.2024.
//


@testable import ImageFeed
import Foundation

final class ProfilePresenterSpy: ProfilePresenterProtocol {
    var viewDidLoadCalled: Bool = false
    var view: ProfileViewControllerProtocol?
    
    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    func exitProfile() { }
    
    func updateAvatar() { }
}
