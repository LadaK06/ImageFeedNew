//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Iurii on 15.07.23.
//

import UIKit

final class SingleImageViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var largeImageURL: URL?
    
    // MARK: - IBOutlet
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!
    
    // MARK: - Private Properties
    
    private var alertPresenter: AlertPresenterProtocol?
    private var image: UIImage! {
        didSet{
            guard isViewLoaded else { return }
            imageView.image = image
            rescaleAndCenterImageInScrollView(image: image)
        }
    }
    
    // MARK: - UIStatusBarStyle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 1.25
        downloadImage()
        alertPresenter = AlertPresenter(viewController: self)
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func didTapShareButton(_ sender: Any) {
        let share = UIActivityViewController(activityItems: [image ?? UIImage.self], applicationActivities: nil)
        present(share, animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    
    private func rescaleAndCenterImageInScrollView(image: UIImage) {
        let minZoomScale = scrollView.minimumZoomScale
        let maxZoomScale = scrollView.maximumZoomScale
        view.layoutIfNeeded()
        let visibleRectSize = scrollView.bounds.size
        let imageSize = image.size
        let hScale = visibleRectSize.width / imageSize.width
        let vScale = visibleRectSize.height / imageSize.height
        let scale = min(maxZoomScale, max(minZoomScale, max(hScale, vScale)))
        scrollView.setZoomScale(scale, animated: false)
        scrollView.layoutIfNeeded()
        
        let newContentSize = scrollView.contentSize
        let x = (newContentSize.width - visibleRectSize.width) / 2
        let y = (newContentSize.height - visibleRectSize.height) / 2
        scrollView.setContentOffset(CGPoint(x: x, y: y), animated: false)
    }
    
    private func downloadImage() {
        UIBlockingProgressHUD.show()
        imageView.kf.setImage(with: largeImageURL) { [weak self] result in
            UIBlockingProgressHUD.dismiss()
            
            guard let self = self else { return }
            
            switch result {
            case .success(let imageResult):
                self.rescaleAndCenterImageInScrollView(image: imageResult.image)
                self.image = imageResult.image
            case .failure:
                showError()
            }
        }
    }
    
    private func showError() {
        let model = AlertModelTwoButton(
            title: "Что-то пошло не так.",
            message: "Попробовать ещё раз?",
            buttonTextOne: "Не надо",
            buttonTextTwo: "Повторить",
            completionOne: nil,
            completionTwo: { [weak self] in
                guard let self = self else { return }
                downloadImage()
            })
        alertPresenter?.showTwoButton(model)
    }
}

// MARK: - UIScrollViewDelegate

extension SingleImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            guard let image = imageView.image else { return }
            rescaleAndCenterImageInScrollView(image: image)
        }
    }
}
