//
//  CreateShortUrlUseCase.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

protocol CreateShortLinkUseCaseProtocol {
    func createShortLink(_ url: URL) async throws -> ShortLink
}

struct CreateShortLinkUseCase: CreateShortLinkUseCaseProtocol {
    
    private let shortLinkRepo: ShortLinkRepo
    
    init(shortLinkRepo: ShortLinkRepo) {
        self.shortLinkRepo = shortLinkRepo
    }
    
    func createShortLink(_ url: URL) async throws -> ShortLink {
        try await shortLinkRepo.createShortLink(url)
    }
}
