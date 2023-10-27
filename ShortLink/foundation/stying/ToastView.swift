//
//  ToastView.swift
//  ShortLink
//
//  Created by Eder  Padilla on 27/10/23.
//

import SwiftUI

struct ToastView: View {
    
    @Binding var isPresented: Bool
    let message: String
    
    init(isPresented: Binding<Bool>, message: String) {
        self._isPresented = isPresented
        self.message = message
    }
    
    var body: some View {
        if isPresented {
            Text(message)
                .padding(EdgeInsets(top: .point4,
                                    leading: .point24,
                                    bottom: .point4,
                                    trailing: .point24))
                .background(Color.secondary)
                .foregroundColor(.white)
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
