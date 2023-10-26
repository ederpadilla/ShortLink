//
//  ShortLinkRemoteDataSource.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

protocol CreateShortLinkRemote {
    func createShortLink(_ url: URL) async throws -> ShortLink
}

class CreateShortLinkRemoteDataSource: CreateShortLinkRemote {
    
    func createShortLink(_ url: URL) async throws -> ShortLink {
        let shortLinkResponse: ShortLinkResponse = try await URLSession.shared.post(url.asShortLinkRequest())
        return shortLinkResponse.asShortLink()
    }
}
