//
//  ShortLinkDomainModels.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

struct ShortLink {
    var alias: String = .empty
    var linkInfo: LinkInfo = LinkInfo()
}

struct LinkInfo {
    var original: String = .empty
    var short: String = .empty
}

extension ShortLink {
    
    func asShortLinkUI() -> ShortLinkItemUI {
        ShortLinkItemUI(shortVersion: String(localized: "Short Version \(linkInfo.short)"),
                        id: String(localized: "Alias Des \(alias)"),
                        original: String(localized: "Original Des \(linkInfo.original)"))
    }
}
