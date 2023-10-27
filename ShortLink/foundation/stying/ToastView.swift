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
                .background(Color.secondary)
                .foregroundColor(.white)
                .cornerRadius(.point10)
                .padding()
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
