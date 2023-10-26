//
//  BuildConfig.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

struct BuildConfig {
    
    static let environment: URL = {
        let stringURL = Bundle.main.infoDictionary?["ENVIRONMENT_URL"] as? String
        return URL(safeString: stringURL.orDefaultString())
    }()
}
