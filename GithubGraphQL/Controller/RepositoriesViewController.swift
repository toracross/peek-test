import UIKit
import Apollo

class RepositoriesViewController: UIViewController {
    
    //System Variable Override
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    private var repos: [Repository] = []
    private var fetching: Bool = false
    private var endCursorKey = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchRepositories(queryType: .initial)
    }
    
    //Functions
    private func setupUI() {
        view.addGradientWithColors(topColor: #colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1), bottomColor: #colorLiteral(red: 0.07843137255, green: 0.1137254902, blue: 0.1490196078, alpha: 1))
    }
    
    private func fetchRepositories(queryType: GithubQueryType) {
        if !fetching {
            fetching = true
            
            GithubService.fetchRepositories(queryType: queryType) { [weak self] (success, repos, endCursorKey) in
                if success, let repos = repos, let endCursorKey = endCursorKey {
                    self?.repos += repos
                    self?.endCursorKey = endCursorKey
                    self?.fetching = false
                    
                    DispatchQueue.main.async {
                        self?.tableView.reloadWithAnimation(withDuration: 0.75)
                        initialReload = false
                    }
                }
            }
        }
    }
}

extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("Repository: \(repos[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension RepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as? RepositoryCell else { return UITableViewCell() }
        cell.set(repo: repos[indexPath.row])
        return cell
    }
    
    //Pagination Support
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == repos.count - 1 {
            fetchRepositories(queryType: .additional(queryKey: endCursorKey))
        }
    }
}
