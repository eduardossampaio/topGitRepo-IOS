//
//  ListPullRequestUseCaseTest.swift
//  TopRepoIOSTests
//
//  Created by Eduardo Sampaio on 02/05/24.
//

import XCTest
@testable import TopRepoIOS
import SwiftyMocky
import RxSwift
import RxTest
import RxBlocking

final class ListPullRequestUseCaseTest: XCTestCase {
    
    let repo1 = Repo(id: 0, name: "JavaGuide", description: "Lista de pullrequests vazias", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2)
    let repo2 = Repo(id: 123, name: "JavaGuide", description: "JavaGuide", authorName: "Snailclimb", authorProfilePictureUrl:  "https://avatars.githubusercontent.com/u/29880145?v=4", starCount: 1, forkCount: 2)

    var gitApiMock = GitApiServiceProtocolMock()
    var useCase:(any ListPRUseCase)?
    
    override func setUpWithError() throws {
        useCase = ListPRUseCaseImpl(gitAPi: gitApiMock)
    }

    override func tearDownWithError() throws {

    }

    func testListPullRequestEmptyList() throws {
        Given(gitApiMock, .listPullRequests(repo: .matching({ [self] repo in
            repo.id == repo1.id
        }), willReturn: Observable.just([])))
        
        let scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        
        let prList = try? useCase?
            .start(params: repo1).subscribe(on: scheduler).toBlocking().first()
        XCTAssertNotNil(prList)
        XCTAssertTrue(prList!.isEmpty)
    }
    
    func testListPullRequestNotEmptyList() throws {
        Given(gitApiMock, .listPullRequests(repo: .matching({ [self] repo in
            repo.id == repo2.id
        }), willReturn: Observable.just(prList)))
        
        let scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        
        let receivedPRList = try? useCase?
            .start(params: repo2).subscribe(on: scheduler).toBlocking().first()
        XCTAssertNotNil(receivedPRList)
        XCTAssertFalse(receivedPRList!.isEmpty)
        XCTAssertEqual(receivedPRList, prList)
    }
    
    func testListPullRequestReturningError() throws {
        let error = NSError(domain: "", code: 1)
        Given(gitApiMock, .listPullRequests(repo: .matching({ [self] repo in
            repo.id == repo2.id
        }), willReturn: Observable.error(error)))
        
        let scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        
        let receivedPRList = try? useCase?
            .start(params: repo2).subscribe(on: scheduler).toBlocking().first()
        XCTAssertNil(receivedPRList)
   
    }


}
