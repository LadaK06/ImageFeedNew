//
//  ImagesListViewControllerSpy.swift
//  ImageFeedTests
//
//  Created by Лада on 25.09.2024.
//


import ImageFeed
import Foundation

final class ImagesListViewControllerSpy: ImagesListViewControllerProtocol {
    func updateTableViewAnimated(oldCount: Int, newCount: Int) { }
    
    func showError() { }
    
    func updateImagesListDetails() { }
}
