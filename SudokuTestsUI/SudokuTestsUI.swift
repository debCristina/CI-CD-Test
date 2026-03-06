//
//  SudokuTestsUI.swift
//  SudokuTestsUI
//
//  Created by Débora Cristina Silva Ferreira on 04/03/26.
//

import XCTest
@testable import CryptoPaper

final class SudokuTestsUI: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testCryptoStyle() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.activate()
        app.launch()

        let cellsQuery = app.cells
        cellsQuery/*@START_MENU_TOKEN@*/.containing(.staticText, identifier: "BNB").firstMatch/*[[".element(boundBy: 2)",".containing(.staticText, identifier: \"658.04000000\").firstMatch",".containing(.staticText, identifier: \"BNB\").firstMatch"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        cellsQuery/*@START_MENU_TOKEN@*/.containing(.staticText, identifier: "IOTA").firstMatch/*[[".element(boundBy: 11)",".containing(.staticText, identifier: \"0.06830000\").firstMatch",".containing(.staticText, identifier: \"IOTA\").firstMatch"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        let windowsQuery = app.windows
        let element = windowsQuery/*@START_MENU_TOKEN@*/.firstMatch/*[[".containing(.other, identifier: nil).firstMatch",".firstMatch"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element.doubleTap()
        XCUIDevice.shared.press(.home)
        
        let springboardApp = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        springboardApp.otherElements/*@START_MENU_TOKEN@*/.containing(.image, identifier: "record.circle").firstMatch/*[[".element(boundBy: 79)",".containing(.image, identifier: \"record.circle\").firstMatch"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element2 = springboardApp/*@START_MENU_TOKEN@*/.images["record.circle"]/*[[".otherElements",".images[\"Gravação de Tela\"]",".images[\"record.circle\"]",".images"],[[[-1,2],[-1,1],[-1,3],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element2.tap()
        
        app.activate()
        element.swipeDown()
        
        let element3 = cellsQuery/*@START_MENU_TOKEN@*/.containing(.staticText, identifier: "XRP").firstMatch/*[[".element(boundBy: 8)",".containing(.staticText, identifier: \"1.42930000\").firstMatch",".containing(.staticText, identifier: \"XRP\").firstMatch"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element3.tap()
        
        let element4 = windowsQuery.element(boundBy: 1)
        element4.tap()
        
        let element5 = app/*@START_MENU_TOKEN@*/.buttons["Buy"]/*[[".buttons.containing(.staticText, identifier: \"Buy\")",".otherElements.buttons[\"Buy\"]",".buttons[\"Buy\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element5.tap()
        element4.swipeDown()
        cellsQuery/*@START_MENU_TOKEN@*/.containing(.staticText, identifier: "EOS").firstMatch/*[[".element(boundBy: 9)",".containing(.staticText, identifier: \"0.77990000\").firstMatch",".containing(.staticText, identifier: \"EOS\").firstMatch"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        element5.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts[" Extract "]/*[[".buttons",".staticTexts",".staticTexts[\" Extract \"]"],[[[-1,2],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        
        let staticTextsQuery = app.staticTexts
        staticTextsQuery.matching(identifier: "0.0000").element(boundBy: 0).tap()
        staticTextsQuery.matching(identifier: "Paid: $0.0000").element(boundBy: 0).tap()
        
        let element6 = app/*@START_MENU_TOKEN@*/.buttons["BackButton"]/*[[".navigationBars",".buttons[\"Coins\"]",".buttons[\"BackButton\"]",".buttons"],[[[-1,2],[-1,1],[-1,3],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element6.tap()
        element3.tap()
        app/*@START_MENU_TOKEN@*/.textFields["0.00"]/*[[".otherElements.textFields[\"0.00\"]",".textFields",".textFields[\"0.00\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.textFields["0.00"]/*[[".otherElements",".textFields[\"fefefeffe\"]",".textFields[\"0.00\"]",".textFields"],[[[-1,2],[-1,1],[-1,3],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("fefefeffe")
        app/*@START_MENU_TOKEN@*/.staticTexts["Buy"]/*[[".buttons[\"Buy\"].staticTexts",".buttons.staticTexts[\"Buy\"]",".staticTexts[\"Buy\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.buttons[" Extract "].firstMatch/*[[".otherElements.buttons[\" Extract \"].firstMatch",".buttons",".containing(.staticText, identifier: \" Extract \").firstMatch",".firstMatch",".buttons[\" Extract \"].firstMatch"],[[[-1,4],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
        element6.tap()
        XCUIDevice.shared.press(.home)
        element2.tap()
        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}

