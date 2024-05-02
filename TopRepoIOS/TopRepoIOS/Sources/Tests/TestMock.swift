//
//  File.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 01/05/24.
//

import Foundation
import Swinject
import RxSwift

var repoList = [
    Repo(id: 0, name: "JavaGuide", description: "Lista de pullrequests vazias", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 414, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 121, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 442, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 124124, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 442, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 412, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "JavaGuide", description: "Ultimo item da primeira lista", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2)
]

var repoList2 = [
    Repo(id: 144, name: "GitHub-Chinese-Top-Charts", description: "Primeiro item da segunda lista", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 414, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 121, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 442, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 124124, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 442, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 412, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2),
    Repo(id: 123, name: "GitHub-Chinese-Top-Charts", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2)
]

var prList = [
    PullRequest(name: "JavaGuide", title: "Update README.md", authorName: "Snailclimb", authorProfilePictureUrl: "https://avatars.githubusercontent.com/u/29880145?v=4", body: ""),
    PullRequest(name: "JavaGuide", title: "Update README.md", authorName: "Snailclimb", authorProfilePictureUrl: "https://avatars.githubusercontent.com/u/29880145?v=4", body: ""),
    PullRequest(name: "JavaGuide", title: "Update README.md", authorName: "Snailclimb", authorProfilePictureUrl: "https://avatars.githubusercontent.com/u/29880145?v=4", body: "")
]

class TestMock{
    
    
    class ListRepositoriesUseCaseMock : ListRepositoriesUseCase {
        
       
        
        var subject = PublishSubject<[Repo]>()
        var disposeBad = DisposeBag()
        
        var page = 0;
        
        func loadMore() {
            
            if(page == 1){
                self.subject.onNext(repoList2)
            }
            page += 1
        }
        
        func start(params: String) -> Observable<[Repo]> {
            DispatchQueue.main.async(){ [self] in
                subject.onNext(repoList)
            }
            return subject
        }
    }
     
    class ListPullRequestsUseCaseMock: ListPRUseCase {
        
       
        func start(params: Repo) -> RxSwift.Observable<[PullRequest]> {
            if(params.id == 0){
                return Observable.just([])
            }
            return Observable.just(prList)
        }
    }
       
    
    static let container: Container = {
        let container = Container()
        
        container.register((any ListRepositoriesInteractor).self) { resolver in
            return ListRepositoriesInteractorImpl(
                useCase:ListRepositoriesUseCaseMock(),
                flowController: resolver.resolve(FlowController.self)!
            )
        }
        
        container.register((any ListPullRequestsInteractor).self){ r in
            let useCase = ListPullRequestsUseCaseMock()
            return ListPullRequestsInteractorImpl(useCase: useCase)
        }

        return container
    }()
}
