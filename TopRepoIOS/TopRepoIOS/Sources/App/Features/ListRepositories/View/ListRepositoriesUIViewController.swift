//
//  ListRepositoriesUIViewController.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import UIKit
import Lottie
class ListRepositoriesUIViewController: UIViewController{
    
    let LIST_REPOSITORY_CELL_IDENTIFIER = "LIST_REPOSITORY_CELL_IDENTIFIER"
    
    //injetar
    var interactor:ListRepositoriesInteractor!
    
    
    var repositories:[Repo] = []
    
    private lazy var loadingView: AnimationView = {
        let animationView:AnimationView = .init(name: "loading_animation")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        return animationView
    }()
    
    private lazy var repositoriesList: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    override func viewDidLoad() {
        setupInjection();
        setupViews()
        interactor.bind(presenter: self)
        interactor.start()
    }
    func setupInjection(){
        interactor = inject(ListRepositoriesInteractor.self)!
    }
    func setupViews(){
        view.backgroundColor = UIColor.white
        view.addSubview(loadingView)
        loadingView.isHidden = true;
        
        
        
        setupTableView()
    }
    func setupTableView() {
        repositoriesList.delegate = self
        repositoriesList.dataSource = self
        view.addSubview(repositoriesList)
        
        repositoriesList.translatesAutoresizingMaskIntoConstraints = false
        repositoriesList.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        repositoriesList.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        repositoriesList.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        repositoriesList.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        repositoriesList.register(RepositoryListItem.self, forCellReuseIdentifier: LIST_REPOSITORY_CELL_IDENTIFIER)
        
        
        repositoriesList.estimatedRowHeight = 68.0
        repositoriesList.rowHeight = UITableView.automaticDimension
    }
}

extension ListRepositoriesUIViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LIST_REPOSITORY_CELL_IDENTIFIER, for: indexPath) as! RepositoryListItem
        
        let repo = repositories[indexPath.item]
        cell.bindItem(repo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension ListRepositoriesUIViewController : ListRepositoryPresenter {
    
    func showRepositories(repositories: [Repo]) {
        showList()
        self.repositories = repositories
        repositoriesList.reloadData()
    }
    
    func showLoading() {
        hideList()
        loadingView.isHidden = false
        loadingView.play()
    }
    
    func hideLoading() {
        loadingView.stop()
        loadingView.isHidden = true
    }
    
    func showError() {
        
    }
    
    private func hideList(){
        repositoriesList.isHidden = true
    }
    
    private func showList(){
        hideLoading()
        repositoriesList.isHidden = false
    }
    
    
}
