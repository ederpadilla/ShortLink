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
    
    private let shortLinkRepository: ShortLinkRepository
    
    init(shortLinkRepository: ShortLinkRepository) {
        self.shortLinkRepository = shortLinkRepository
    }
    
    func createShortLink(_ url: URL) async throws -> ShortLink {
        try await shortLinkRepository.createShortLink(url)
    }
}
