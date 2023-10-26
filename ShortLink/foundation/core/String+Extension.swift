//
//  String+Extension.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

extension String {
    
    static let empty = ""
}

extension Optional where Wrapped == String {
    
    func orDefaultString() -> String {
        return self ?? .empty
    }
}
