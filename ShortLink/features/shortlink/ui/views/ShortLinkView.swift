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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear(perform: {
            createShortLink()
        })
        .padding()
    }
    
    func createShortLink() {
        viewModel.createShortLink(url: URL(safeString: "https://www.facebook.com"))
    }
}

#Preview {
    ShortLinkInjector.provideShortLinkView()
}
