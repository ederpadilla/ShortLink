//
//  ShortLinkViewModel.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

class ShortLinkViewModel: ObservableObject {
    
    @Published var shortLinkUi = ShortLinkUi()
    private let createShortLinkUseCase: CreateShortLinkUseCaseProtocol
    
    init(createShortLinkUseCase: CreateShortLinkUseCaseProtocol) {
        self.createShortLinkUseCase = createShortLinkUseCase
    }
    
    func createShortLink(urlString: String) {
        guard !urlString.isEmpty else {
            shortLinkUi.toast = Toast(isShowing: true, message: String(localized: "Empty URL"))
            return
        }
        
        guard let url = URL(string: urlString), url.scheme != nil, url.host != nil else {
            shortLinkUi.toast = Toast(isShowing: true, message: String(localized: "Invalid URL"))
            return
        }
        
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
