//
//  ListRepositoriesInteractor.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import RxSwift
protocol ListRepositoriesInteractor : BaseInteractor  where Presenter == ListRepositoryPresenter, Param == Any {
    func onEndListReached()
    
    func onItemClicked(repo: Repo)
}

class ListRepositoriesInteractorImpl : ListRepositoriesInteractor {
    
    private var useCase: (any ListRepositoriesUseCase)?
    private var presenter: ListRepositoryPresenter? = nil
    private var flowController: FlowController!
    
    private var disposeBag = DisposeBag()
    
    init(
        useCase: any ListRepositoriesUseCase,
        flowController: FlowController,
        presenter: ListRepositoryPresenter? = nil) {
            
            self.useCase = useCase
            self.flowController = flowController
            self.presenter = presenter
        }
    
    func start(_ params: Any?, with: ListRepositoryPresenter) {
        self.presenter = with
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
