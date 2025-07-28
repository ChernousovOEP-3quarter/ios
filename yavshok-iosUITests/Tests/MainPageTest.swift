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
        
    
    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    
    @MainActor
    func testCheckExistingUser() throws {
        mainPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertCheckEmailButtonIsDisplayed()
            .inputEmail(email: EnvData.stored.email)
            .clickCheckEmailButton()
            .assertTextIsVisible(text: "Ты уже в ШОКе")
    }
    
    
    @MainActor
    func testCheckNonExistingUser() throws {
        mainPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertCheckEmailButtonIsDisplayed()
            .inputEmail(email: FakerDataGenerator.generateEmail())
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
    
}
