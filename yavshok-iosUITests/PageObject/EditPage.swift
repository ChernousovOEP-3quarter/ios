//
//  EditPage.swift
//  yavshok-ios
//
//  Created by Zuikaku on 27.07.2025.
//

import XCTest

final class EditPage {
    
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    
    private var screenTitle: XCUIElement {
        return app.staticTexts["editTitle"].firstMatch
    }
    
    private var nameField: XCUIElement {
        return app.textFields["nameField"].firstMatch
    }
    
    private var saveButton: XCUIElement {
        return app.buttons["saveButton"].firstMatch
    }
    
    private var cancelButton: XCUIElement {
        return app.buttons["cancelButton"].firstMatch
    }
    
    
    @discardableResult
    func assertPageIsOpened() -> Self {
        XCTAssert(screenTitle.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertNameFieldIsDisplayed() -> Self {
        XCTAssert(nameField.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertSaveButtonIsDisplayed() -> Self {
        XCTAssert(saveButton.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertCancelButtonIsDisplayed() -> Self {
        XCTAssert(cancelButton.waitForExistence(timeout: 2))
        return self
    }
    
    
    @discardableResult
    func clearNameField() -> Self {
        nameField.tap()
        if let currentValue = nameField.value as? String {
                let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentValue.count)
                nameField.typeText(deleteString)
            }
        return self
    }
    
    @discardableResult
    func inputName(name: String) -> Self {
        nameField.tap()
        nameField.typeText(name)
        return self
    }
    
    @discardableResult
    func clickSaveButton() -> Self {
        saveButton.tap()
        return self
    }
    
    @discardableResult
    func clickCancelButton() -> Self {
        cancelButton.tap()
        return self
    }
    
    @discardableResult
    func assertSaveButtonIsDisabled() -> Self {
        XCTAssert(!saveButton.isEnabled)
        return self
    }
    
}
