//
//  GithubServiceApi.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import RxSwift
class GithubServiceApi: GitApiServiceProtocol{
    func listAllRepositories(page: Int, searchQuery: SearchQuery?) -> Observable<[Repo]> {
       
        let repo = Repo(id: 123, name: "repo massa", description: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguis", authorName: "Eduardo", authorProfilePictureUrl: "", starCount: 555, forkCount: 777)
        
        let repo2 = Repo(id: 567, name: "repo muito doido", description: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble ", authorName: "Eduardo", authorProfilePictureUrl: "", starCount: 1241, forkCount: 9877)
        
        let repo3 = Repo(id: 879, name: "repo foda", description: "that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguis", authorName: "Eduardo", authorProfilePictureUrl: "", starCount: 12411, forkCount: 87622)
        
        
        return Observable.just([repo,repo2,repo3]);
    }
    
    
}
