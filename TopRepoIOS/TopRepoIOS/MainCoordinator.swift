//
//  MainCoordinator.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import UIKit

protocol FlowController {
    func navigateDetails(repository: Repo)
}

final class MainCoordinator: Coordinator, FlowController{
    
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        DIManager.getConteiner().register(FlowController.self) { resolve in
            self
        }
    }
    
    
    func start() {
        let vc = ListRepositoriesUIViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateDetails(repository: Repo){
        let vc = ListPullRequestsViewController(repo: repository)
        navigationController.pushViewController(vc, animated: true)
    }
}
