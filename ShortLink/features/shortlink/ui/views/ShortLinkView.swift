//
//  ShortLinkView.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import SwiftUI

struct ShortLinkView: View {
    
    @StateObject var viewModel: ShortLinkViewModel
    
    var body: some View {
        
        ZStack {
            NavigationView {
                
                VStack {
                    
                    InputLinkView(text: $viewModel.shortLinkUi.inputURLText,
                                  didSelectSendButton: { string in
                        viewModel.createShortLink(urlString: string)
                    })
                    
                    ShortLinkListView(shortLinks: viewModel.shortLinkUi.shortLinkItems)
                    
                }
                .navigationTitle(String(localized: "Short Link Title"))
                .overlay { ToastView(toast: $viewModel.shortLinkUi.toast) }
            }
            
            if viewModel.shortLinkUi.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    ShortLinkInjector.provideShortLinkView()
}
