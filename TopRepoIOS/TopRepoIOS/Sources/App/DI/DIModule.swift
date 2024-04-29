//
//  DIModule.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import Swinject

class DIManager{
    static let container: Container = {
        let container = Container()
        container.register(ListRepositoriesInteractor.self) { Resolver in
            return ListRepositoriesInteractorImpl()
        }
        container.register(ListRepositoriesUIViewController.self) { r in
            let controller = ListRepositoriesUIViewController()
            controller.interactor = r.resolve(ListRepositoriesInteractor.self)!
            return controller
        }
        return container
    }()
    
}


extension UIViewController {
    
    func inject<Service>(_ serviceType: Service.Type) -> Service? {
        return DIManager.container.resolve(serviceType)
    }
}
