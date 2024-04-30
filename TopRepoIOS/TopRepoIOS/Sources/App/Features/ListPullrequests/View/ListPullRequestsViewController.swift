//
//  ListPullRequestsViewController.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 30/04/24.
//

import Foundation
import UIKit
class ListPullRequestsViewController : BaseUIVIewController {
    
    let LIST_PULL_REQUEST_CELL_IDENTIFIER = "LIST_PULL_REQUEST_CELL_IDENTIFIER"
    
    var repo:Repo!
    var pullRequestList: [PullRequest] = []
    lazy var interactor: ListPullRequestsInteractor = inject(ListPullRequestsInteractor.self)!
    
    private lazy var pullRequestListTableView: UITableView = {
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
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = repo.name
        
        
        pullRequestListTableView.register(PullRequestListItem.self, forCellReuseIdentifier: LIST_PULL_REQUEST_CELL_IDENTIFIER)
        
        pullRequestListTableView.dataSource = self
        pullRequestListTableView.delegate = self
        pullRequestListTableView.estimatedRowHeight = 200
        pullRequestListTableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(pullRequestListTableView)
        
        pullRequestListTableView.anchor(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor )
        interactor.bind(presenter: self)
        interactor.start(params: repo)
    }
}

extension ListPullRequestsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequestList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LIST_PULL_REQUEST_CELL_IDENTIFIER, for: indexPath) as! PullRequestListItem
        let pullRequest = pullRequestList[indexPath.item]
        cell.bindItem(pullRequest)
                        
        return cell
    }
    
    
}

extension ListPullRequestsViewController : ListPRPresenter {
    
    func showPullRequestList(pullRequestList: [PullRequest]) {
        hideLoading()
        if(pullRequestList.isEmpty){
            self.showEmptyResult()
        }else{
            self.pullRequestList = pullRequestList
            self.pullRequestListTableView.reloadData()
        }
    }
    
}
