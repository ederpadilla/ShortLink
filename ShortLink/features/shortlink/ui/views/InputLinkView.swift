//
//  InputLinkView.swift
//  ShortLink
//
//  Created by Eder  Padilla on 29/10/23.
//

import SwiftUI

struct InputLinkView: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField(String(localized:"Insert URL Shortener"),
                      text: $text)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.point10)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(.point10)
            .keyboardType(.URL)
            .textContentType(.URL)
            
            Button(action: {
                print("Texto enviado: \(text)")
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
    }
}
