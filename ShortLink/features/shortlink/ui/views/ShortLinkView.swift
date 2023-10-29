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
            
            VStack {
                Spacer()
                ToastView(toast: $viewModel.shortLinkUi.toast)
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: .point0,
                                        leading: .point16,
                                        bottom: .point24,
                                        trailing: .point16))
            }
            .alignmentGuide(.bottom) { d in d[.bottom] }
        }
    }
}

#Preview {
    ShortLinkInjector.provideShortLinkView()
}
