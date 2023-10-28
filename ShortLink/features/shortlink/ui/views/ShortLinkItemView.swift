//
//  ShortLinkItemView.swift
//  ShortLink
//
//  Created by Eder  Padilla on 27/10/23.
//

import SwiftUI

struct ShortLinkItemView: View {
    
    let shortLinkUI: ShortLinkItemUI
    
    var body: some View {
        
        ZStack {
            VStack {
                Text(shortLinkUI.shortVersion)
                    .font(.system(size: .point16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Text(shortLinkUI.id)
                    .font(.system(size: .point14))
                    .foregroundColor(.gray)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Text(shortLinkUI.original)
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
