//
//  HomeRemoteModels.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

extension URL {
    
    func asShortLinkRequest() -> ShortLinkRequest {
        ShortLinkRequest(url: description)
    }
}

struct ShortLinkRequest: Encodable {
    let url: String
}

struct ShortLinkResponse: Decodable {
    var alias: String? = nil
    var links: [LinkResponse]? = nil
}

struct LinkResponse: Decodable {
    var selfOriginal: String? = nil
    var short: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case selfOriginal = "self"
        case short = "short"
    }
}
