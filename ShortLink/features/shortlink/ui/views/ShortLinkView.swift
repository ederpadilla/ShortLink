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
    let items: [Item] = [
        Item(name: "John Doe", id: "1234", original: "Original 1"),
        Item(name: "Jane Smith", id: "5678", original: "Original 2"),
        // Agrega más elementos aquí
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
                    
                    
                    List(items) { item in
                        ShortLinkItemView(item: item)
                    }
                    .listStyle(PlainListStyle())
                    
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

struct Item: Identifiable {
    var name: String
    var id: String
    var original: String
}

#Preview {
    ShortLinkInjector.provideShortLinkView()
}

struct ShortLinkItemView: View {
    
    let item: Item
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("·\(item.name)")
                    .font(.system(size: .point16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Text("·\(item.id)")
                    .font(.system(size: .point14))
                    .foregroundColor(.gray)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Text("·\(item.original)")
                    .font(.system(size: .point14))
                    .foregroundColor(.gray)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding(.point10)
        }
        .background(
            RoundedRectangle(cornerRadius: .point10)
                .stroke(Color(UIColor.systemGray2), lineWidth: .point1)
        )
    }
}
