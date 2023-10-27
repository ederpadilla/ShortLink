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
                    .padding(10)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                
                Button(action: {
                    // Agrega aquí la lógica para enviar el texto
                    print("Texto enviado: \(texto)")
                }) {
                    Text("Enviar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .frame(width: 80) // Ancho del botón
            }
            .padding(.horizontal, 20)
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
