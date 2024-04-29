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
        container.register(GitApiServiceProtocol.self) { resolver in
            return GithubServiceApi()
        }
        
        container.register(ListRepositoriesUseCase.self) { resolver in
            return ListRepositoriesUseCaseImpl(
                gitApiService: resolver.resolve(GitApiServiceProtocol.self)!
            )
        }
        container.register(ListRepositoriesInteractor.self) { resolver in
            return ListRepositoriesInteractorImpl(
                useCase: resolver.resolve(ListRepositoriesUseCase.self)!
            )
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
