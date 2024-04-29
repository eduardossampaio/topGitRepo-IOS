//
//  ListRepositoriesInteractor.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import RxSwift
protocol ListRepositoriesInteractor : BaseInteractor{
    
}

class ListRepositoriesInteractorImpl : ListRepositoriesInteractor, ListRepositoriesUseCaseInteractor {
    var listRepositoriesObserver: RxSwift.Observable<[Repo]>?
    
    private var useCase: ListRepositoriesUseCase
    private var presenter: ListRepositoryPresenter? = nil
    
    private var disposeBag = DisposeBag()
    
    init(useCase: ListRepositoriesUseCase, presenter: ListRepositoryPresenter? = nil) {
        self.useCase = useCase
        self.presenter = presenter
        self.useCase.interactor = self
    }
    
    func bind(presenter: BasePresenter) {
        self.presenter = presenter as? ListRepositoryPresenter
    }
    
    func start() {
        setupObservers()
        presenter?.showLoading();
        
        useCase.start(params: nil)
                
    }
    
    func setupObservers(){
        listRepositoriesObserver?.subscribe(onNext: { repositoryList in
            self.presenter?.showRepositories(repositories: repositoryList)
        },onError: { error in
            self.presenter?.showError()
        }).disposed(by: disposeBag)
    }
    func destroy() {
        
    }
    
    
}
