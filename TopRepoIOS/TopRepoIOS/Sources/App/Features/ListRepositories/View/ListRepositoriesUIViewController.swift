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
    
//    private lazy var loginLabel: UILabel = {
//        let view = UILabel(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 20
//        return view
//      }()

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
        view.backgroundColor = UIColor.white
        
       
        setupTableView()
        
       
        view.addSubview(loadingView)
        loadingView.isHidden = true;
        
        loadingView.play(completion: { _ in
      
        })
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
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LIST_REPOSITORY_CELL_IDENTIFIER, for: indexPath) as! RepositoryListItem
        let repo = Repo(id: 123, name: "repo massa", description: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguis", authorName: "Eduardo", authorProfilePictureUrl: "", starCount: 555, forkCount: 777)
        
        cell.bindItem(repo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
//        return 256
    }
    
    
}
