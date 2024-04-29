//
//  ListRepositoriesUseCase.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import RxSwift
protocol ListRepositoriesUseCaseInteractor {
    var listRepositoriesObserver: Observable<[Repo]>? { get set }
}
protocol ListRepositoriesUseCase : UseCase<Any>{
    var interactor: ListRepositoriesUseCaseInteractor? { get set }
} 
class ListRepositoriesUseCaseImpl :UseCase<Any>, ListRepositoriesUseCase {    
    private var _interactor: ListRepositoriesUseCaseInteractor? = nil
    var interactor: ListRepositoriesUseCaseInteractor? {
        set{
            _interactor = newValue
            _interactor?.listRepositoriesObserver = publishSubject
        }
        get{
            return _interactor
        }
    }
    
    private var gitApiService: GitApiServiceProtocol
    let publishSubject = PublishSubject<[Repo]>()
    
    let disposeBag = DisposeBag()

    
    init(gitApiService: GitApiServiceProtocol) {
        self.gitApiService = gitApiService
        publishSubject.disposed(by: disposeBag)
    }
    
    override func start(params: Any?) {
        fetchRepositories(page: 0)
    }
    
    private func fetchRepositories(page:Int){
        let searchQuery = SearchQuery()
        
        if  self.interactor != nil {
            self.gitApiService.listAllRepositories(page: 0, searchQuery: searchQuery).subscribe { repositories in
                
                self.publishSubject.onNext(repositories)
            }
        }
    }
}
