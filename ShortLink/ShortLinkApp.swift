//
//  ShortLinkApp.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import SwiftUI

@main
struct ShortLinkApp: App {
    var body: some Scene {
        WindowGroup {
            ShortLinkInjector.provideShortLinkView()
        }
    }
}
