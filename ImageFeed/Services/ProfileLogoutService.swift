//
//  ProfileLogoutService.swift
//  ImageFeed
//
//  Created by Лада on 23.09.2024.
//

import Foundation
import WebKit
import SwiftKeychainWrapper

final class ProfileLogoutService {
    static let shared = ProfileLogoutService()
    
    private init() { }
    
    func logout() {
        cleanCookies()
        cleanToken()
        cleanImagesList()
    }
    
    private func cleanCookies() {
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
            }
        }
    }
    
    private func cleanToken() {
        OAuth2TokenStorage().token = nil
    }
    
    private func cleanProfile() {
        ProfileService.shared.cleanProfile()
        ProfileImageService.shared.cleanAvatarURL()
    }
    
    private func cleanImagesList() {
        ImagesListService.shared.cleanPhotosList()
    }
}


