//
//  ListPullRequestsInteractor.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 30/04/24.
//

import Foundation
import RxSwift

protocol ListPullRequestsInteractor : BaseInteractor<Repo> {
   
}

class ListPullRequestsInteractorImpl: BaseInteractor<Repo>, ListPullRequestsInteractor, ListPRUseCaseInteractor {
    
    var listPullRequestsObserver: Observable<[PullRequest]>?
           
    private var useCase: ListPRUseCase
    private var presenter: ListPRPresenter!
    private var disposeBag = DisposeBag()
    
    init(useCase: ListPRUseCase){
        self.useCase = useCase        
    }
    
    override func bind(presenter: BasePresenter) {
        self.presenter = presenter as? ListPRPresenter
        self.useCase.interactor = self
    }
    
    
    override func start(params: Repo) {
        presenter.showLoading()
        listPullRequestsObserver?.subscribe(onNext: { pullRequestList in
            self.presenter?.showPullRequestList(pullRequestList: pullRequestList)
        },onError: { error in
            self.presenter?.showError()
        }).disposed(by: disposeBag)
        
        useCase.start(params: params)
    }
    
}
