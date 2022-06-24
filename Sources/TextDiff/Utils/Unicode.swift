//
//  Unicode.swift
//  
//
//  Created by Arthur Guiot on 6/24/22.
//

import Foundation


extension UnicodeScalar {
    
    var isAlphanumeric: Bool {
        return CharacterSet.alphanumerics.contains(self)
    }
    
    var isWhitespaceOrNewline: Bool {
        return CharacterSet.whitespacesAndNewlines.contains(self)
    }
    
    var isNewline: Bool {
        return CharacterSet.newlines.contains(self)
    }
}
