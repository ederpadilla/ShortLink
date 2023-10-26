//
//  URL+Extension.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

extension URL {
    
    public init(safeString string: String) {
        guard
            let decodedString = string.removingPercentEncoding,
            let encodedString = decodedString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let instance = URL(string: encodedString)
        else {
            fatalError("Unconstructable URL: \(string)")
        }
        self = instance
    }
}
