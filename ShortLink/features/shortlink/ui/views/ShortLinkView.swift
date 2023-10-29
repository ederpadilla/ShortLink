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
                                  didSelectSendButton: { textValue in
                        viewModel.createShortLink(textValue)
                    })
                    
                    ShortLinkListView(shortLinks: viewModel.shortLinkUi.shortLinkItems)
                    
                }
                .navigationTitle(String(localized: "Short Link Title"))
            }
            
            if viewModel.shortLinkUi.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
            }
            
            ToastView(toast: $viewModel.shortLinkUi.toast)
            
        }
    }
}

#Preview {
    ShortLinkInjector.provideShortLinkView()
}
