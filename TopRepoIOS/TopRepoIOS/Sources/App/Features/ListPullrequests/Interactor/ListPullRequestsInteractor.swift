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
        listPullRequestsObserver?.subscribe(onNext: { pullRequestList in
            self.presenter?.showPullRequestList(pullRequestList: pullRequestList)
        },onError: { error in
            self.presenter?.showError()
        }).disposed(by: disposeBag)
        
        useCase.start(params: params)
    }
    
//    func start___() {
//        presenter.showPullRequestList(pullRequestList:
//                                        [
//            PullRequest(name: "Pull request", title: "Repo massa", authorName: "EDuardo", authorProfilePictureUrl: "https://avatars.githubusercontent.com/u/21018904?v=4", date: Date(), body: " that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are per"),
//
//            PullRequest(name: "Pull request", title: "Repo massa", authorName: "EDuardo", authorProfilePictureUrl: "",date: Date(), body: " that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are per"),
//
//            PullRequest(name: "Pull request", title: "Repo massa", authorName: "EDuardo", authorProfilePictureUrl: "https://avatars.githubusercontent.com/u/21018904?v=4", date: Date(), body: " that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are per"),
//
//            PullRequest(name: "Pull request", title: "Repo massa", authorName: "EDuardo", authorProfilePictureUrl: "https://avatars.githubusercontent.com/u/21018904?v=4",date: Date(), body: " that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are per")
//        ])
//
//    }
    
}
