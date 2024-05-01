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
        
        container.register((any ListRepositoriesUseCase).self) { resolver in
            return ListRepositoriesUseCaseImpl(
                gitApiService: resolver.resolve(GitApiServiceProtocol.self)!
            )
        }
        container.register((any ListRepositoriesInteractor).self) { resolver in
            return ListRepositoriesInteractorImpl(
                useCase: resolver.resolve((any ListRepositoriesUseCase).self)!,
                flowController: resolver.resolve(FlowController.self)!
            )
        }
        
        container.register(ListRepositoriesUIViewController.self) { r in
            let controller = ListRepositoriesUIViewController()
            controller.interactor = r.resolve((any ListRepositoriesInteractor).self)!
            return controller
        }
        
        container.register((any ListPRUseCase).self) { r in
            return ListPRUseCaseImpl(gitAPi: r.resolve(GitApiServiceProtocol.self)!)
        }
        
        container.register((any ListPullRequestsInteractor).self){ r in
            let useCase = r.resolve((any ListPRUseCase).self)!
            return ListPullRequestsInteractorImpl(useCase: useCase)
        }
        
        return container
    }()
    
}


extension UIViewController {
    
    func inject<Service>(_ serviceType: Service.Type) -> Service? {
        return DIManager.container.resolve(serviceType)
    }
}
