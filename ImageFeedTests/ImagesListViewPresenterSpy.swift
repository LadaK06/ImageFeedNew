//
//  ImagesListViewPresenterSpy.swift
//  ImageFeedTests
//
//  Created by Лада on 25.09.2024.
//


@testable import ImageFeed
import UIKit

final class ImagesListViewPresenterSpy: ImagesListViewPresenterProtocol {
    var view: ImagesListViewControllerProtocol?
    var updateIsCalled = false
    
    func updateTableViewAnimated() {
        updateIsCalled = true
    }
    
    func fetchPhotosNextPage(indexPath: IndexPath) { }
    
    func imageListCellDidTapLike(_ cell: ImagesListCell, indexPath: IndexPath?) { }
    
    func getPhotosCount() -> Int {
        return 0
    }
    
    func getPhoto(indexPath: IndexPath) -> Photo? {
        return nil
    }
    
    func getCellHeight(indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        return CGFloat()
    }
    
    func getLargeImageURL(indexPath: IndexPath) -> URL? {
        return nil
    }
    
    func updateImagesListDetails() { }
}
