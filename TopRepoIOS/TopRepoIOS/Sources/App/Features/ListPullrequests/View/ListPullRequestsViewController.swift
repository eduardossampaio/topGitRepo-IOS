//
//  ListPullRequestsViewController.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 30/04/24.
//

import Foundation
import UIKit
class ListPullRequestsViewController :UIViewController {
    
    let LIST_PULL_REQUEST_CELL_IDENTIFIER = "LIST_PULL_REQUEST_CELL_IDENTIFIER"
    
    var repo:Repo!
    
    private lazy var pullRequestsList: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    init(repo:Repo){
        super.init(nibName: nil, bundle: nil)
        self.repo = repo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        title = repo.name
        
        
        pullRequestsList.register(RepositoryListItem.self, forCellReuseIdentifier: LIST_PULL_REQUEST_CELL_IDENTIFIER)
        
        pullRequestsList.dataSource = self
        pullRequestsList.delegate = self
        
        view.addSubview(pullRequestsList)
        
        pullRequestsList.anchor(top:view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor )
    }
}

extension ListPullRequestsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LIST_PULL_REQUEST_CELL_IDENTIFIER, for: indexPath) as! RepositoryListItem
        return cell
    }
    
    
}
