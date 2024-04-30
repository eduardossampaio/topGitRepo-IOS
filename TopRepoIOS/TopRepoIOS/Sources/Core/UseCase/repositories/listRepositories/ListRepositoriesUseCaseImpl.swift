//
//  ListRepositoriesUseCase.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import RxSwift

protocol ListRepositoriesUseCase : UseCase {
    
    typealias Param = String
    typealias Result = [Repo]
    
    func loadMore();
} 
class ListRepositoriesUseCaseImpl :UseCase, ListRepositoriesUseCase {
    
    
    func start(params: String) -> RxSwift.Observable<[Repo]> {
        fetchRepositories(page: 0)
        return publishSubject
    }
    
    
    private var gitApiService: GitApiServiceProtocol
    private var currentPage = 0
    let publishSubject = PublishSubject<[Repo]>()
    
    let disposeBag = DisposeBag()
    
    
    init(gitApiService: GitApiServiceProtocol) {
        self.gitApiService = gitApiService
        publishSubject.disposed(by: disposeBag)
    }    
    
    private func fetchRepositories(page:Int){
        let searchQuery = SearchQuery(languages: Languages.Java,sortBy: SortType.stars)
        
        self.gitApiService.listAllRepositories(page: self.currentPage, searchQuery: searchQuery).subscribe { repositories in
            self.publishSubject.onNext(repositories)
        }.disposed(by: disposeBag)
    }
    
    func loadMore() {
        currentPage += 1
        fetchRepositories(page: currentPage)
    }
}
