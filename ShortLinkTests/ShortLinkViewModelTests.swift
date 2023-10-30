//
//  ShortLinkViewModelTests.swift
//  ShortLinkTests
//
//  Created by Eder  Padilla on 29/10/23.
//

import XCTest
@testable import ShortLink

final class ShortLinkViewModelTests: XCTestCase {
    
    func testCreateShortLinkWithValidURL() {
        let useCase = MockCreateShortLinkUseCase(success: true)
        let viewModel = ShortLinkViewModel(createShortLinkUseCase: useCase)
        let expectation = XCTestExpectation(description: "Create short link successfully")
        
        
        viewModel.createShortLink("https://google.com")
        
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            
            XCTAssertFalse(viewModel.shortLinkUi.isLoading)
            
            
            XCTAssertFalse(viewModel.shortLinkUi.toast.isShowing)
            
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testCreateShortLinkWithInvalidURL() {
        
        let useCase = MockCreateShortLinkUseCase(success: false)
        let viewModel = ShortLinkViewModel(createShortLinkUseCase: useCase)
        let expectation = XCTestExpectation(description: "Create short link with invalid URL")
        
        
        viewModel.createShortLink("invalid-url")
        
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            
            XCTAssertFalse(viewModel.shortLinkUi.isLoading)
            
            
            XCTAssertTrue(viewModel.shortLinkUi.toast.isShowing)
            XCTAssertEqual(viewModel.shortLinkUi.toast.message, String(localized: "Error Invalid URL"))
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}

class MockCreateShortLinkUseCase: CreateShortLinkUseCaseProtocol {
    let success: Bool
    
    init(success: Bool) {
        self.success = success
    }
    
    func createShortLink(_ url: URL) async throws -> ShortLink {
        if success {
            return ShortLink(alias: "testAlias", linkInfo: LinkInfo(original: "testOriginal", short: "testShort"))
        } else {
            throw ShortLinkError.invalidURL
        }
    }
}
