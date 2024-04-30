//
//  ListRepositoriesUIViewController.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import UIKit
import Lottie
class ListRepositoriesUIViewController: BaseUIVIewController{
    
    let LIST_REPOSITORY_CELL_IDENTIFIER = "LIST_REPOSITORY_CELL_IDENTIFIER"
    
    //injetar
    lazy var interactor:ListRepositoriesInteractor = inject(ListRepositoriesInteractor.self)!
        
    var repositories:[Repo] = []
    
    private lazy var repositoriesList: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        interactor.bind(presenter: self)
        interactor.start(params: self)
    }

    func setupViews(){
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
        
        title = "Top Java repositories"
    }
    
    func reachLastItem(){
        interactor.onEndListReached()
    }
    
    func itemClicked(_ repo:Repo){
        interactor.onItemClicked(repo: repo)
    }
    
    override func showLoading() {
        hideList()
        super.showLoading()
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
        
        if(indexPath.item == repositories.count - 1){
            reachLastItem();
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemClicked(repositories[indexPath.item])
    }
}


extension ListRepositoriesUIViewController : ListRepositoryPresenter {
    
    func showRepositories(repositories: [Repo]) {
        showList()
        self.repositories.append(contentsOf: repositories)
        repositoriesList.reloadData()
    }
    
    private func hideList(){
        repositoriesList.isHidden = true
    }
    
    private func showList(){
        hideLoading()
        repositoriesList.isHidden = false
    }
    
   
    
    
}
