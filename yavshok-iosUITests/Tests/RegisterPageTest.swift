//
//  RegisterPageTest.swift
//  yavshok-ios
//
//  Created by Zuikaku on 27.07.2025.
//

import XCTest

final class RegisterPageTest: XCTestCase {

    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
    private lazy var registerPage = RegisterPage(app: app)
        
    
    override func setUp() {
        super.setUp()
        app.launch()
        
        mainPage
            .assertPageIsOpened()
            .assertToLoginButtonIsDisplayed()
            .clickToLoginButton()
        
        loginPage
            .assertPageIsOpened()
            .assertToRegisterButtonIsDisplayed()
            .clickToRegisterButton()
    }
    
    
    @MainActor
    func testRedirectBackToLoginPage() throws {
        registerPage
            .assertPageIsOpened()
            .assertBackButtonIsDisplayed()
            .clickBackButton()
        
        loginPage
            .assertPageIsOpened()
    }
    
    
    @MainActor
    func testThrowWarningForAlreadyExistingUserEmail() throws {
        registerPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertAgeFieldIsDisplayed()
            .assertRegisterButtonIsDisplayed()
            .inputEmail(email: EnvData.stored.email)
            .inputPassword(password: FakerDataGenerator.generatePassword())
            .inputAge(age: FakerDataGenerator.generateAge())
            .clickRegisterButton()
            .assertTextIsVisible(text: "Пользователь уже зарегистрирован")
    }
    
    
    @MainActor
    func testLockRegisterButtonForTooShortPassword() throws {
        registerPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertAgeFieldIsDisplayed()
            .assertRegisterButtonIsDisplayed()
            .inputEmail(email: FakerDataGenerator.generateEmail())
            .inputPassword(password: FakerDataGenerator.generateShortPassword())
            .inputAge(age: FakerDataGenerator.generateAge())
            .clickRegisterButton()
            .assertRegisterButtonIsDisabled()
    }
    
    @MainActor
    func testLockRegisterButtonForEmptyEmail() throws {
        registerPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertAgeFieldIsDisplayed()
            .assertRegisterButtonIsDisplayed()
            .assertAgeFieldIsEmpty()
            .inputPassword(password: FakerDataGenerator.generatePassword())
            .inputAge(age: FakerDataGenerator.generateAge())
            .clickRegisterButton()
            .assertRegisterButtonIsDisabled()
    }
    
    
    @MainActor
    func testLockRegisterButtonForEmptyPassword() throws {
        registerPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertAgeFieldIsDisplayed()
            .assertRegisterButtonIsDisplayed()
            .inputEmail(email: FakerDataGenerator.generateEmail())
            .assertPasswordFieldIsEmpty()
            .inputAge(age: FakerDataGenerator.generateAge())
            .clickRegisterButton()
            .assertRegisterButtonIsDisabled()
    }
    
    
    @MainActor
    func testLockRegisterButtonForEmptyAge() throws {
        registerPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertAgeFieldIsDisplayed()
            .assertRegisterButtonIsDisplayed()
            .inputEmail(email: FakerDataGenerator.generateEmail())
            .inputPassword(password: FakerDataGenerator.generatePassword())
            .assertAgeFieldIsEmpty()
            .clickRegisterButton()
            .assertRegisterButtonIsDisabled()
    }
    
    
    @MainActor
    func testLockRegisterButtonForEmptyFields() throws {
        registerPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertAgeFieldIsDisplayed()
            .assertRegisterButtonIsDisplayed()
            .assertEmailFieldIsEmpty()
            .assertPasswordFieldIsEmpty()
            .assertAgeFieldIsEmpty()
            .clickRegisterButton()
            .assertRegisterButtonIsDisabled()
    }
    
    
    // Баг: отсутствует какая-либо валидация формата email
}
