//
//  ListRepositoriesInteractor.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import RxSwift
protocol ListRepositoriesInteractor : BaseInteractor<Any>{
    func onEndListReached()
    
    func onItemClicked(repo: Repo)
}

class ListRepositoriesInteractorImpl : BaseInteractor<Any>,ListRepositoriesInteractor {
    
    private var useCase: (any ListRepositoriesUseCase)?
    private var presenter: ListRepositoryPresenter? = nil
    private var flowController: FlowController!
    
    private var disposeBag = DisposeBag()
    
    init(
        useCase: any ListRepositoriesUseCase,
        flowController: FlowController,
        presenter: ListRepositoryPresenter? = nil) {
            
            super.init()
            
            self.useCase = useCase
            self.flowController = flowController
            self.presenter = presenter
        }
    
    override func bind(presenter: BasePresenter) {
        self.presenter = presenter as? ListRepositoryPresenter
    }
    
    override func start(params: Any) {            
        
        presenter?.showLoading();
        useCase?.start(params: "").subscribe(onNext: { repositoryList in
            self.presenter?.showRepositories(repositories: repositoryList)
        }).disposed(by: disposeBag)
    }
    
    
    func onEndListReached(){
        useCase?.loadMore()
    }
    
    func onItemClicked(repo: Repo){
        flowController.navigateDetails(repository: repo)
    }
    
}
