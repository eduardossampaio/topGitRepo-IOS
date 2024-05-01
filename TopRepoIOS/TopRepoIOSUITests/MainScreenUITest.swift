//
//  MainScreenUITest.swift
//  TopRepoIOSUITests
//
//  Created by Eduardo Sampaio on 01/05/24.
//

import XCTest

final class MainScreenUITest: XCTestCase {

    var app: XCUIApplication!
       
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }

    override func tearDownWithError() throws {
    }

    
    func testShouldShowRepositoriesList() throws {
        app.launch()
        sleep(5)
        let viewController = app.otherElements["ListRepositoriesUIViewController"]
        XCTAssertTrue(viewController.exists)
        let repositoriesTables = app.tables.matching(identifier: "repositoriesList")
        //lista existe
        XCTAssertTrue(repositoriesTables.count > 0)
        //lista tem celular preenchidas
        XCTAssertTrue(repositoriesTables.cells.count > 0)
    }
    
    func testShouldShowMoreRepositoriesInListAfterScroll() throws {
        app.launch()
        let viewController = app.otherElements["ListRepositoriesUIViewController"]
        XCTAssertTrue(viewController.exists)
        let repositoriesTables = app.tables.matching(identifier: "repositoriesList")
        //lista existe
        XCTAssertTrue(repositoriesTables.count > 0)
        
        //lista tem celular preenchidas
        XCTAssertTrue(repositoriesTables.cells.count > 0)
        
        let initialItensOnTable = repositoriesTables.cells.count

        app.swipeUp(velocity: .fast)
        app.swipeUp(velocity: .fast)
        app.swipeUp(velocity: .fast)
        
        //verifica se carregou mais itens
        XCTAssertTrue(repositoriesTables.cells.count > initialItensOnTable)

    }
    
    func testShouldRedirectToListRepoScreenWithEmptyRepositories() throws {
        app.launch()
        let viewController = app.otherElements["ListRepositoriesUIViewController"]
        XCTAssertTrue(viewController.exists)
        let repositoriesTables = app.tables.matching(identifier: "repositoriesList")
        //lista existe
        XCTAssertTrue(repositoriesTables.count > 0)
        
        let firstCell = repositoriesTables.cells.element(boundBy: 0)
        
        firstCell.tap()
        
        let emptyList = app.otherElements["emptyListView"]
        
        XCTAssertTrue(emptyList.exists)
        
    }
    
    func testShouldRedirectToListPullRequestScreenWithExistingItems() throws {
        app.launch()
        let viewController = app.otherElements["ListRepositoriesUIViewController"]
        XCTAssertTrue(viewController.exists)
        let repositoriesTables = app.tables.matching(identifier: "repositoriesList")
        //lista existe
        XCTAssertTrue(repositoriesTables.count > 0)
        
        let firstCell = repositoriesTables.cells.element(boundBy: 1)
        
        firstCell.tap()
        
        let emptyList = app.otherElements["emptyListView"]
        let pullrequestList = app.tables["pullRequestList"]
        
        XCTAssertFalse(emptyList.exists)
        XCTAssertTrue(pullrequestList.exists)
        
    }
    
}
