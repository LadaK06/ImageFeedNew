

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Subview Properties
    
    private var avatarImageView: UIImageView!
    private var noPhotoImageView: UIImageView!
    private var nameLabel: UILabel!
    private var loginLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var favoritesLabel: UILabel!
    private var logoutButton: UIButton!
    
    // MARK: - UIStatusBarStyle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAvatarImageView()
        createNameLabel()
        createLoginLabel()
        createDescriptionLabel()
//        createFavoritesLabel()
//        createNoPhotoImageView()
        createLogoutButton()
    }
    
    // MARK: - IBAction
    
    @objc
    private func didTapLogoutButton() {
        avatarImageView.image = UIImage(named: "Stub.png")
        nameLabel.removeFromSuperview()
        nameLabel = nil
        loginLabel.removeFromSuperview()
        loginLabel = nil
        descriptionLabel.removeFromSuperview()
        descriptionLabel = nil
        NSLayoutConstraint.activate([
            favoritesLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            favoritesLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 102)
        ])
        logoutButton.isEnabled = false
    }
    
    // MARK: - Private Methods
    
    private func createAvatarImageView() {
        let avatarImageView = UIImageView(image: UIImage(named: "test profile photo.png"))
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 70),
            avatarImageView.widthAnchor.constraint(equalToConstant: 70),
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
        self.avatarImageView = avatarImageView
    }
    
    private func createNameLabel() {
        let nameLabel = UILabel()
        nameLabel.text = "Екатерина Новикова"
        nameLabel.textColor = .ypWhite
        nameLabel.font = UIFont.boldSystemFont(ofSize: 23)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8)
        ])
        self.nameLabel = nameLabel
    }
    
    private func createLoginLabel() {
        let loginLabel = UILabel()
        loginLabel.text = "@ekaterina_nov"
        loginLabel.textColor = .ypGray
        loginLabel.font = UIFont.systemFont(ofSize: 13)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginLabel)
        NSLayoutConstraint.activate([
            loginLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            loginLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])
        self.loginLabel = loginLabel
    }
    
    private func createDescriptionLabel() {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.textColor = .ypWhite
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8)
        ])
        self.descriptionLabel = descriptionLabel
    }
    
    private func createFavoritesLabel() {
        let favoritesLabel = UILabel()
        favoritesLabel.text = "Избранное"
        favoritesLabel.textColor = .ypWhite
        favoritesLabel.font = UIFont.boldSystemFont(ofSize: 23)
        favoritesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favoritesLabel)
        NSLayoutConstraint.activate([
            favoritesLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            favoritesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24)
        ])
        self.favoritesLabel = favoritesLabel
    }
    
    private func createNoPhotoImageView() {
        let noPhotoImageView = UIImageView(image: UIImage(named: "No Photo.png"))
        noPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noPhotoImageView)
        NSLayoutConstraint.activate([
            noPhotoImageView.heightAnchor.constraint(equalToConstant: 115),
            noPhotoImageView.widthAnchor.constraint(equalToConstant: 115),
            noPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noPhotoImageView.topAnchor.constraint(equalTo: favoritesLabel.bottomAnchor, constant: 110)
        ])
        self.noPhotoImageView = noPhotoImageView
    }
    
    private func createLogoutButton() {
        let logoutButton = UIButton.systemButton(
            with: UIImage(named: "Exit.png")!,
            target: self,
            action: #selector(Self.didTapLogoutButton)
        )
        logoutButton.tintColor = .ypRed
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        NSLayoutConstraint.activate([
            logoutButton.heightAnchor.constraint(equalToConstant: 44),
            logoutButton.widthAnchor.constraint(equalToConstant: 44),
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logoutButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])
        self.logoutButton = logoutButton
    }
}
