//
//  ListPullRequestsInteractor.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 30/04/24.
//

import Foundation
import RxSwift

protocol ListPullRequestsInteractor : BaseInteractor  where Presenter == ListPRPresenter, Param == Repo {

}

class ListPullRequestsInteractorImpl: ListPullRequestsInteractor {
           
    private var useCase: any ListPRUseCase
    private var presenter: ListPRPresenter!
    private var disposeBag = DisposeBag()
    
    init(useCase: any ListPRUseCase){
        self.useCase = useCase        
    }
       
    func start(_ params: Repo?, with presenter: ListPRPresenter) {
        self.presenter = presenter
        if let repo = params{
            presenter.showLoading()
            useCase.start(params: repo ).subscribe(onNext: { pullRequestList in
                self.presenter?.showPullRequestList(pullRequestList: pullRequestList)
            },onError: { error in
                self.presenter?.showError()
            }).disposed(by: disposeBag)
        }

    }
    
}
