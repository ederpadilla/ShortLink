//
//  HomeRemoteDataSource.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

protocol CreateShortLinkRemote {
    func createShortLink(_ url: URL) async throws -> ShortLinkResponse
}

class CreateShortLinkRemoteDataSource: CreateShortLinkRemote {
    
    func createShortLink(_ url: URL) async throws -> ShortLinkResponse {
        let shortLinkResponse: ShortLinkResponse = try await URLSession.shared.post(url.asShortLinkRequest())
        return shortLinkResponse
    }
}
