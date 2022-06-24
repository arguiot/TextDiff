//
//  Regex.swift
//  
//
//  Created by Arthur Guiot on 6/24/22.
//

import Foundation


extension NSRegularExpression {
    
    // NOTE: swiftc crashes when using a typealias for matching options
#if os(Linux)
    func matches(_ string: String, options: NSMatchingOptions = []) -> Bool {
        let range = NSRange(location: 0, length: string.unicodeScalars.count)
        return firstMatch(in: string, options: options, range: range) != nil
    }
#else
    func matches(_ string: String, options: NSRegularExpression.MatchingOptions = []) -> Bool {
        let range = NSRange(location: 0, length: string.unicodeScalars.count)
        return firstMatch(in: string, options: options, range: range) != nil
    }
#endif
    
}
