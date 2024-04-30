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

class ListPullRequestsInteractorImpl: BaseInteractor<Repo>, ListPullRequestsInteractor {
    
    var listPullRequestsObserver: Observable<[PullRequest]>?
           
    private var useCase: any ListPRUseCase
    private var presenter: ListPRPresenter!
    private var disposeBag = DisposeBag()
    
    init(useCase: any ListPRUseCase){
        self.useCase = useCase        
    }
    
    override func bind(presenter: BasePresenter) {
        self.presenter = presenter as? ListPRPresenter
    }
    
    
    override func start(params: Repo) {
        presenter.showLoading()
        useCase.start(params: params ).subscribe(onNext: { pullRequestList in
            self.presenter?.showPullRequestList(pullRequestList: pullRequestList)
        },onError: { error in
            self.presenter?.showError()
        }).disposed(by: disposeBag)
        
    }
    
}
