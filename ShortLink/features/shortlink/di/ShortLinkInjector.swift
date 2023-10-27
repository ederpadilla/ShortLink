//
//  ShortLinkInjector.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

enum ShortLinkInjector {
    
    private static func provideCreateShortLinkRemoteDataSource() -> CreateShortLinkRemoteDataSource {
        CreateShortLinkRemoteDataSource()
    }
    
    private static func provideShortLinkRepository() -> ShortLinkRepository {
        ShortLinkRepository(createShortLinkRemote: provideCreateShortLinkRemoteDataSource())
    }
    
    private static func provideCreateShortLinkUseCase() -> CreateShortLinkUseCase {
        CreateShortLinkUseCase(shortLinkRepository: provideShortLinkRepository())
    }
    
    private static func provideShortLinkViewModel() -> ShortLinkViewModel {
        ShortLinkViewModel(createShortLinkUseCase: provideCreateShortLinkUseCase())
    }
    
    static func provideShortLinkView() -> ShortLinkView {
        ShortLinkView(viewModel: provideShortLinkViewModel())
    }
}
