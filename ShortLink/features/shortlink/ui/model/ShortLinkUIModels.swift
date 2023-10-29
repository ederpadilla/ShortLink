//
//  ShortLinkUIModels.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

struct ShortLinkUi {
    var isLoading: Bool = false
    var shortLinkItems: [ShortLinkItemUI] = []
    var toast = Toast(isShowing: false, message: .empty)
    var inputURLText: String = .empty
}

struct ShortLinkItemUI: Identifiable {
    var shortVersion: String
    var id: String
    var original: String
}
