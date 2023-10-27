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
    @State private var showToast = true
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Ingresa tu texto", text: $texto)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.point10)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(.point10)
                
                Button(action: {
                    print("Texto enviado: \(texto)")
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
        }
        .padding()
        .overlay(
            ToastView(isPresented: $showToast) {
                Text("¡Este es un Toast!")
            }
        )
        Spacer()
        
    }
    
    func createShortLink() {
        viewModel.createShortLink(url: URL(safeString: "https://www.facebook.com"))
    }
}

#Preview {
    ShortLinkInjector.provideShortLinkView()
}
