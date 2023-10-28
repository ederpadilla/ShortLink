//
//  ShortLinkView.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import SwiftUI

struct ShortLinkView: View {
    
    @StateObject var viewModel: ShortLinkViewModel
    @State private var texto = ""
    @State private var toast = Toast(isShowing: true, message: "¡Este es un Toast!")
    let items: [ShortLink] = [
        ShortLink(alias: "1234121qwqwe3",
                  linkInfo: LinkInfo(original: "www.facebookddasd.com",
                                     short: "https:uasdasdkasasa.com")),
        ShortLink(alias: "12ds34121qwqwe3",
                  linkInfo: LinkInfo(original: "www.facebookd.com",
                                     short: "https:uassasa.com")),
        ShortLink(alias: "12dwwe3",
                  linkInfo: LinkInfo(original: "www.google.com",
                                     short: "https:aaaauassasa.com"))
    ]
    
    var body: some View {
        
        ZStack {
            NavigationView {
                
                VStack {
                    
                    HStack {
                        TextField(String(localized:"Insert URL Shortener"),
                                  text: $texto)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.point10)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(.point10)
                        .keyboardType(.URL)
                        .textContentType(.URL)
                        
                        Button(action: {
                            print("Texto enviado: \(texto)")
                            hideKeyboard()
                        }) {
                            Image(systemName: "paperplane.fill")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(.point10)
                        }
                        .frame(maxHeight: .infinity)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .point40)
                    .padding(EdgeInsets(top: .point32,
                                        leading: .point16,
                                        bottom: .point0,
                                        trailing: .point16))
                    
                    ShortLinkListView(shortLinks: items.map { $0.asShortLinkUI() })
                    
                }
                .navigationTitle(String(localized: "Short Link Title"))
                .overlay { ToastView(toast: $toast) }
            }
            
        }
    }
    
    func createShortLink() {
        viewModel.createShortLink(url: URL(safeString: "https://www.facebook.com"))
    }
    
    
}

#Preview {
    ShortLinkInjector.provideShortLinkView()
}
