//
//  TopRepoIOSTests.swift
//  TopRepoIOSTests
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import XCTest
@testable import TopRepoIOS
import SwiftyMocky
import RxSwift

final class TopRepoIOSTests: XCTestCase {
    
    let repo = Repo(id: 0, name: "JavaGuide", description: "Lista de pullrequests vazias", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2)
    
    var gitApiMock = GitApiServiceProtocolMock()
    var useCase:(any ListRepositoriesUseCase)?

    override func setUpWithError() throws {
        useCase = ListRepositoriesUseCaseImpl(gitApiService: gitApiMock)
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        let searchQuery = SearchQuery(languages: Languages.Java,sortBy: SortType.stars)
        Given(gitApiMock, .listAllRepositories(page: .any, searchQuery: .any, willReturn: Observable.just(repoList))  )
        
        useCase?.start(params: "").subscribe { repos in
            XCTAssertEqual(repos, [])
        }
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
