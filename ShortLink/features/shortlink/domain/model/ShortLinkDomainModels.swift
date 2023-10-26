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
