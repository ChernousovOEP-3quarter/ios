//
//  MainPageTest.swift
//  yavshok-ios
//
//  Created by Zuikaku on 26.07.2025.
//

import XCTest

final class MainPageTest: XCTestCase {

    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app: app)
        
    
    override func setUp() async throws {
        try await super.setUp()
        await app.launch()
    }
    
    
    @MainActor
    func testCheckExistingUser() throws {
        
        mainPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertCheckEmailButtonIsDisplayed()
            .inputEmail(email: "1testQA@yandex.ru") // Добавить env
            .clickCheckEmailButton()
            .assertTextIsVisible(text: "Ты уже в ШОКе")
        
    }
    
    @MainActor
    func testCheckNonExistingUser() throws {
        
        mainPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertCheckEmailButtonIsDisplayed()
            .inputEmail(email: "lsddsl@ds.re") // Добавить faker
            .clickCheckEmailButton()
            .assertTextIsVisible(text: "Ты еще не в ШОКе")
        
    }
    
    @MainActor
    func testLockCheckButtonWhenEmailIsEmpty() throws {
        
        mainPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertCheckEmailButtonIsDisplayed()
            .assertEmailFieldIsEmpty()
            .clickCheckEmailButton()
            .assertTextIsNotVisible(text: "Ты еще не в ШОКе")
            .assertTextIsNotVisible(text: "Ты уже в ШОКе")
        
    }
    
    
    
    /*
    // SHOK #2
    @MainActor
    func testNavigateFromMainScrenToLoginScreen() throws {
        app.launch()
        
        let toLoginButton = app.buttons["navigationButton"].firstMatch
        
        XCTAssert(app.staticTexts["mainTitle"].firstMatch.waitForExistence(timeout: 5))
        XCTAssert(toLoginButton.waitForExistence(timeout: 5))
        toLoginButton.tap()
        
        XCTAssert(app.staticTexts["loginTitle"].firstMatch.waitForExistence(timeout: 5))
        XCTAssert(app.staticTexts["mainTitle"].firstMatch.waitForNonExistence(timeout: 5))
    }
    */
    
}
