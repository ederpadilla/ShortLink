//
//  ToastView.swift
//  ShortLink
//
//  Created by Eder  Padilla on 27/10/23.
//

import SwiftUI

struct ToastView<Content>: View where Content: View {
    
    @Binding var isPresented: Bool
    let content: Content
    
    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.content = content()
    }
    
    var body: some View {
        if isPresented {
            content
                .padding(EdgeInsets(top: 4, leading: 24, bottom: 4, trailing: 24))
                .background(Color.secondary)
                .foregroundColor(.white) //AVaV25*GdgJs4u4
                .cornerRadius(.point10)
                .transition(.opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isPresented.toggle()
                        }
                    }
                }
        }
    }
}
