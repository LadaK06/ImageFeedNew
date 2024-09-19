
import Foundation

final class ProfileService {
   
    // MARK: - Constants
    
    static let shared = ProfileService()
    private let urlSession = URLSession.shared
    
    // MARK: - Private Properties
    
    private(set) var profile: Profile?
    private var task: URLSessionTask?
    
    private init() {}
    
    // MARK: - Public Methods
    
    func fetchProfile(_ token: String, completion: @escaping (Result<Profile, Error>) -> Void) {
        assert(Thread.isMainThread)
        guard profile == nil else { return }
        task?.cancel()
        
        var request: URLRequest? = selfProfileRequest
        request?.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        guard let request = request else {
            return
        }
        
        let task = urlSession.objectTask(for: request) { [weak self] (result: Result<ProfileResult, Error>) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let body):
                    let profile = Profile(
                        username: body.username,
                        name: "\(body.firstName) \(body.lastName ?? "")",
                        loginName: "@\(body.username)",
                        bio: body.bio ?? "Hello, world!"
                    )
                    self.profile = profile
                    completion(.success(profile))
                case .failure(let error):
                    print("[ProfileService] Error fetching Profile: \(error)")
                    completion(.failure(error))
                    self.profile = nil
                }
            }
        }
        self.task = task
        task.resume()
    }

    func cleanProfile() {
        profile = nil
        task = nil
    }
}

private extension ProfileService {
    var selfProfileRequest: URLRequest {
        URLRequest.makeHTTPRequest(path: "/me", httpMethod: "GET")
    }
}
