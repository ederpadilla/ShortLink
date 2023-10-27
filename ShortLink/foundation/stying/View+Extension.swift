//
//  View+Extension.swift
//  ShortLink
//
//  Created by Eder  Padilla on 27/10/23.
//


import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
