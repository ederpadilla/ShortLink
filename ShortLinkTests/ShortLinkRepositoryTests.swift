//
//  ShortLinkTests.swift
//  ShortLinkTests
//
//  Created by Eder  Padilla on 26/10/23.
//

import XCTest
@testable import ShortLink

final class ShortLinkRepositoryTests: XCTestCase {
    let url = "https://google.com"
    
    func testCreateShortLinkSuccess() async {
        let shortLink = ShortLink(alias: "testAlias", linkInfo: LinkInfo(original: "testOriginal", short: "testShort"))
        let mockRepo = MockShortLinkRepository(result: .success(shortLink))
        let useCase = CreateShortLinkUseCase(shortLinkRepo: mockRepo)
        
        
        do {
            let result = try await useCase.createShortLink(URL(string: url)!)
            
            XCTAssertEqual(result.linkInfo.original, shortLink.linkInfo.original)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testCreateShortLinkInvalidResponse() async {
        
        let mockRepo = MockShortLinkRepository(result: .failure(NetworkError.invalidResponse))
        
        
        do {
            let _ = try await mockRepo.createShortLink(URL(string: url)!)
            XCTFail("Should throw NetworkError.invalidResponse")
        } catch {
            XCTAssertTrue((error as? NetworkError) == .invalidResponse)
        }
    }
    
    func testCreateShortLinkInvalidRequestData() async {
        
        let mockRepo = MockShortLinkRepository(result: .failure(NetworkError.invalidRequestData))
        
        do {
            let _ = try await mockRepo.createShortLink(URL(string: url)!)
            XCTFail("Should throw NetworkError.invalidRequestData")
        } catch {
            XCTAssertTrue((error as? NetworkError) == .invalidRequestData)
        }
    }
    
    func testCreateShortLinkInvalidStatusCode() async {
        let mockRepo = MockShortLinkRepository(result: .failure(NetworkError.invalidStatusCode))
        
        do {
            let _ = try await mockRepo.createShortLink(URL(string: url)!)
            XCTFail("Should throw NetworkError.invalidStatusCode")
        } catch {
            XCTAssertTrue((error as? NetworkError) == .invalidStatusCode)
        }
    }
    
    func testCreateShortLinkNoInternetConnection() async {
        let mockRepo = MockShortLinkRepository(result: .failure(NetworkError.noInternetConnection))
        
        do {
            let _ = try await mockRepo.createShortLink(URL(string: url)!)
            XCTFail("Should throw NetworkError.noInternetConnection")
        } catch {
            XCTAssertTrue((error as? NetworkError) == .noInternetConnection)
        }
    }
    
    func testCreateShortLinkTimeoutError() async {
        let mockRepo = MockShortLinkRepository(result: .failure(NetworkError.timeout))
        let useCase = CreateShortLinkUseCase(shortLinkRepo: mockRepo)
        
        do {
            let result = try await useCase.createShortLink(URL(string: url)!)
            XCTFail("Should throw NetworkError.timeout")
        } catch {
            XCTAssertTrue((error as? NetworkError) == .timeout)
        }
    }
    
}

class MockShortLinkRepository: ShortLinkRepo {
    let result: Result<ShortLink, NetworkError>
    
    init(result: Result<ShortLink, NetworkError>) {
        self.result = result
    }
    
    func createShortLink(_ url: URL) async throws -> ShortLink {
        switch result {
        case .success(let shortLink):
            return shortLink
        case .failure(let error):
            throw error
        }
    }
}
