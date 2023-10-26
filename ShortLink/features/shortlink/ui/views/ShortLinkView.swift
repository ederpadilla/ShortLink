//
//  ShortLinkView.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import SwiftUI

struct ShortLinkView: View {
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
        Task {
            do {
                let response = try await CreateShortLinkRemoteDataSource().createShortLink(URL(safeString: "https://www.facebook.com"))
                print("resposne \(response)")
            } catch {
                print("error \(error)")
            }
        }
    }
}

#Preview {
    ShortLinkView()
}
