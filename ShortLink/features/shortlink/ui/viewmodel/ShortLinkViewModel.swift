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
    
    func createShortLink(_ urlString: String) {
        shortLinkUi.isLoading = true
        Task {
            do {
                let url = try validateURL(urlString)
                let shortLink = try await createShortLinkUseCase.createShortLink(url)
                await MainActor.run {
                    handleCreateShortLinkSuccess(shortLink)
                }
            } catch {
                await MainActor.run {
                    handleCreateShortLinkError(error)
                }
            }
        }
    }
    
    private func validateURL(_ urlString: String) throws -> URL {
        guard !urlString.isEmpty else {
            throw ShortLinkError.emptyURL
        }
        
        guard let url = URL(string: urlString) else {
            throw ShortLinkError.invalidURL
        }
        return url
    }
    
    private func handleCreateShortLinkSuccess(_ shortLink: ShortLink) {
        shortLinkUi.shortLinkItems.insert(shortLink.asShortLinkUI(), at: .zero)
        shortLinkUi.isLoading = false
    }
    
    private func handleCreateShortLinkError(_ error: Error) {
        shortLinkUi.isLoading = false
        shortLinkUi.toast.message =
        switch error {
        case ShortLinkError.emptyURL:
            String(localized: "Error Empty URL")
        case ShortLinkError.invalidURL:
            String(localized: "Error Invalid URL")
        case NetworkError.noInternetConnection:
            String(localized: "Error No Internet")
        case NetworkError.timeout:
            String(localized: "Error Timeout")
        case NetworkError.invalidRequestData:
            String(localized: "Error Invalid Request")
        case NetworkError.invalidResponse:
            String(localized: "Error Invalid Response")
        case NetworkError.invalidStatusCode:
            String(localized: "Error Invalid Status Code")
        default:
            String(localized: "Error Unknown")
        }
        shortLinkUi.toast.isShowing = true
    }
}

enum ShortLinkError: Error {
    case emptyURL
    case invalidURL
}
