//
//  MainCoordinator.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import UIKit
final class MainCoordinator: Coordinator{
    
    var navigationController: UINavigationController

        init(navigationController: UINavigationController) {
            self.navigationController = navigationController
        }

        
        func start() {
//            let viewModel = LoginViewModel(coordinator: self)
//            let vc = LoginViewController(viewModel: viewModel)
            let vc = ListRepositoriesUIViewController()
            navigationController.pushViewController(vc, animated: true)
        }
}
