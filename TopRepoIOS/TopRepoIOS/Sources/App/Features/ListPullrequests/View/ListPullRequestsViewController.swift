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
        pullRequestListTableView.estimatedRowHeight = 68.0
        pullRequestListTableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(pullRequestListTableView)
        
        pullRequestListTableView.anchor(top:view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor )
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
        
        
//        let repo3 = Repo(id: 879, name: "repo foda", description: "that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguis", authorName: "Eduardo",
//                         authorProfilePictureUrl: "https://avatars.githubusercontent.com/u/21018904?v=4", starCount: 12411, forkCount: 87622)
//
        let pullRequest = pullRequestList[indexPath.item]
        cell.bindItem(pullRequest)
                        
        return cell
    }
    
    
}

extension ListPullRequestsViewController : ListPRPresenter {
    
    func showPullRequestList(pullRequestList: [PullRequest]) {
        hideLoading()
        self.pullRequestList = pullRequestList
        self.pullRequestListTableView.reloadData()
    }
    
    
}
