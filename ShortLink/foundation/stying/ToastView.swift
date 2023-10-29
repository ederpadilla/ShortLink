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
            VStack {
                Spacer()
                Text(toast.message)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: .point4,
                                        leading: .point24,
                                        bottom: .point4,
                                        trailing: .point24))
                    .background(Color.secondary)
                    .foregroundColor(.white)
                    .cornerRadius(.point10)
                
            }
            .padding(EdgeInsets(top: .point0,
                                leading: .point32,
                                bottom: .point24,
                                trailing: .point32))
            .alignmentGuide(.bottom) { d in d[.bottom] }
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
