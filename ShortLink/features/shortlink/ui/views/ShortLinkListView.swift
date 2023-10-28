//
//  ShortLinkListView.swift
//  ShortLink
//
//  Created by Eder  Padilla on 27/10/23.
//

import SwiftUI

struct ShortLinkListView: View {
    
    let shortLinks: [ShortLinkItemUI]
    
    var body: some View {
        List(shortLinks) { shortLink in
            ShortLinkItemView(shortLinkUI: shortLink)
        }
        .listStyle(PlainListStyle())
    }
}
