//
//  ShortLinkViewModel.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

class ShortLinkViewModel: ObservableObject {
    
    private let createShortLinkUseCase: CreateShortLinkUseCaseProtocol
    
    init(createShortLinkUseCase: CreateShortLinkUseCaseProtocol) {
        self.createShortLinkUseCase = createShortLinkUseCase
    }
    
    func createShortLink(url: URL) {
        Task {
            do {
                let shortLink = try await createShortLinkUseCase.createShortLink(url)
                await MainActor.run {
                    print("shortLink \(shortLink)")
                }
            } catch {
                await MainActor.run {
                    print("error \(error)")
                }
            }
        }
    }
}
