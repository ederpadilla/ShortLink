//
//  ShortLinkRepository.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

protocol ShortLinkRepo {
    func createShortLink(_ url: URL) async throws -> ShortLink
}

struct ShortLinkRepository: ShortLinkRepo {
    
    private let createShortLinkRemote: CreateShortLinkRemote
    
    init(createShortLinkRemote: CreateShortLinkRemote) {
        self.createShortLinkRemote = createShortLinkRemote
    }
    
    func createShortLink(_ url: URL) async throws -> ShortLink {
        try await createShortLinkRemote.createShortLink(url)
    }
}
