//
//  GitApiServiceProtocol.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import RxSwift
protocol GitApiServiceProtocol {

    func listAllRepositories(page:Int, searchQuery:SearchQuery?) -> Observable<[Repo]>
//
//    func listPullRequests(repo: Repo): Observable<List<PullRequest>>
}
