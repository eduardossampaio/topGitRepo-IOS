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
import RxTest
import RxBlocking

final class TopRepoIOSTests: XCTestCase {

    
    var gitApiMock = GitApiServiceProtocolMock()
    var useCase:(any ListRepositoriesUseCase)?

    override func setUpWithError() throws {
        useCase = ListRepositoriesUseCaseImpl(gitApiService: gitApiMock)
    }

    override func tearDownWithError() throws {
        useCase = nil
    }

    func testShouldReceiveRepositoriesListWhenStart() throws {

        let scheduler = ConcurrentDispatchQueueScheduler(qos: .default)

        Given(gitApiMock, .listAllRepositories(page: .any, searchQuery: .any, willReturn: Observable.just(repoList).delay(.seconds(2), scheduler: scheduler) ))
        let repoList = try? useCase?
            .start(params: "").subscribe(on: scheduler).toBlocking().first()
        XCTAssertEqual(repoList, repoList);

    }
    
    func testShouldReceiveRepositoriesListWhenCallMoreItems() throws {
       
        let scheduler = ConcurrentDispatchQueueScheduler(qos: .default)

        Given(gitApiMock, .listAllRepositories(page: 0, searchQuery: .any, willReturn: Observable.just(repoList).delay(.seconds(2), scheduler: scheduler) ))
        Given(gitApiMock, .listAllRepositories(page: 1, searchQuery: .any, willReturn: Observable.just(repoList2).delay(.seconds(2), scheduler: scheduler) ))
        
        let observer = useCase?.start(params: "").subscribe(on: scheduler)
        
        let repoList = try? observer?.toBlocking().first()
        
        XCTAssertEqual(repoList, repoList);
        
        useCase?.loadMore()
        
        let repoList2 = try? observer?.toBlocking().first()
        
        XCTAssertEqual(repoList2, repoList2);
    }

}
