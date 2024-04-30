//
//  ListPRUseCase.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 30/04/24.
//

import Foundation
import RxSwift

protocol ListPRUseCaseInteractor {
    var listPullRequestsObserver: Observable<[PullRequest]>? { get set }
}

protocol ListPRUseCase : UseCase<Repo> {
    var interactor: ListPRUseCaseInteractor? { get set }
}


class ListPRUseCaseImpl : UseCase<Repo>, ListPRUseCase {
    
    let publishSubject = PublishSubject<[PullRequest]>()
    let disposeBag = DisposeBag()
    
    private var _interactor: ListPRUseCaseInteractor? = nil
    var interactor: ListPRUseCaseInteractor? {
        set{
            _interactor = newValue
            _interactor?.listPullRequestsObserver = publishSubject
        }
        get{
            return _interactor
        }
    }
    
    private var gitAPi: GitApiServiceProtocol!
    
    init(gitAPi: GitApiServiceProtocol){
        super.init()
        self.gitAPi = gitAPi;
    }
    
    override func start(params: Repo?) {
        guard let repo = params else{
            return
        }
        self.gitAPi.listPullRequests(repo: repo).subscribe(
            onNext: { pullrequest in
                self.publishSubject.onNext(pullrequest)
            },
            onError: { error in
                self.publishSubject.onError(error)
            }
        ).disposed(by: disposeBag)
    }
    
}
