//
//  ProfileViewControllerSpy.swift
//  ImageFeedTests
//
//  Created by Лада on 25.09.2024.
//


import ImageFeed
import Foundation

final class ProfileViewControllerSpy: ProfileViewControllerProtocol {
    func updateProfileDetails(profile: Profile?) {}
    
    func updateAvatar(imageURL: URL) { }
}
