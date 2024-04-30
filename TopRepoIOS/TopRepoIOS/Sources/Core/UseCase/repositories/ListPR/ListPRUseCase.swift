//
//  ListPRUseCase.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 30/04/24.
//

import Foundation
import RxSwift

protocol ListPRUseCase : UseCase {
    typealias Param = Repo
    
    typealias Result = [PullRequest]
    
}


class ListPRUseCaseImpl : UseCase, ListPRUseCase {
    func start(params: Repo) -> RxSwift.Observable<[PullRequest]> {
        return self.gitAPi.listPullRequests(repo: params)
    }
    
    
    let publishSubject = PublishSubject<[PullRequest]>()
    let disposeBag = DisposeBag()
    
    private var gitAPi: GitApiServiceProtocol!
    
    init(gitAPi: GitApiServiceProtocol){
        self.gitAPi = gitAPi;
    }
        
}
