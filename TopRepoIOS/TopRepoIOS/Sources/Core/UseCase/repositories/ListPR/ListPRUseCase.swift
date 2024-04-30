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
    
    override func start(params: Repo?) {
        
       let list =  [
PullRequest(name: "Pull request", title: "Repo massa", authorName: "EDuardo", authorProfilePictureUrl: "https://avatars.githubusercontent.com/u/21018904?v=4", date: Date(), body: " that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are per"),

PullRequest(name: "Pull request", title: "Repo massa", authorName: "EDuardo", authorProfilePictureUrl: "",date: Date(), body: " that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are per"),

PullRequest(name: "Pull request", title: "Repo massa", authorName: "EDuardo", authorProfilePictureUrl: "https://avatars.githubusercontent.com/u/21018904?v=4", date: Date(), body: " that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are per"),

PullRequest(name: "Pull request", title: "Repo massa", authorName: "EDuardo", authorProfilePictureUrl: "https://avatars.githubusercontent.com/u/21018904?v=4",date: Date(), body: " that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguisthat are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are per")
]
        
        publishSubject.onNext(list)
    }
    
}
