//
//  ToastView.swift
//  ShortLink
//
//  Created by Eder  Padilla on 27/10/23.
//

import SwiftUI

struct ToastView: View {
    
    @Binding var toast: Toast
    
    var body: some View {
        if toast.isShowing {
            Text(toast.message)
                .padding(EdgeInsets(top: .point4,
                                    leading: .point24,
                                    bottom: .point4,
                                    trailing: .point24))
                .multilineTextAlignment(.center)
                .background(Color.secondary)
                .foregroundColor(.white)
                .cornerRadius(.point10)
                .transition(.opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            toast.isShowing.toggle()
                        }
                    }
                }
        }
    }
}

struct Toast {
    var isShowing: Bool = false
    var message: String = .empty
}
