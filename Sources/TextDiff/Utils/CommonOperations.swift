//
//  CommonOperations.swift
//  
//
//  Created by Arthur Guiot on 6/24/22.
//

import Foundation

extension String {
    func commonPrefix(with other: String) -> String {
        // Quick check for common null cases.
        if self.isEmpty || other.isEmpty || self.first != other.first {
            return ""
        }
        
        // Binary search.
        // Performance analysis: http://neil.fraser.name/news/2007/10/09/
        var pointerMin = 0
        var pointerMax = min(self.count, other.count)
        var pointerMid = pointerMax
        var pointerStart = 0
        while pointerMin < pointerMid {
            let substring1 = self[pointerStart..<pointerMid]
            let substring2 = other[pointerStart..<pointerMid]
            if substring1 == substring2 {
                pointerMin = pointerMid
                pointerStart = pointerMin
            } else {
                pointerMax = pointerMid
            }
            pointerMid = Int(floor(Float(pointerMax - pointerMin) / 2.0 + Float(pointerMin)))
        }
        return String(self.prefix(pointerMid))
    }

    func commonSuffix(with other: String) -> String {
        // Quick check for common null cases.
        if self.isEmpty || other.isEmpty || self.last != other.last {
            return ""
        }
        
        let length1 = self.count
        let length2 = other.count
        
        // Binary search.
        // Performance analysis: http://neil.fraser.name/news/2007/10/09/
        var pointerMin = 0
        var pointerMax = min(length1, length2)
        var pointerMid = pointerMax
        var pointerEnd = 0
        while pointerMin < pointerMid {
            let substring1 = self[(length1 - pointerMid)..<(length1 - pointerEnd)]
            let substring2 = other[(length2 - pointerMid)..<(length2 - pointerEnd)]
            if substring1 == substring2 {
                pointerMin = pointerMid
                pointerEnd = pointerMin
            } else {
                pointerMax = pointerMid
            }
            pointerMid = Int(floor(Float(pointerMax - pointerMin) / 2.0 + Float(pointerMin)))
        }
        return String(self.suffix(pointerMid))
    }
    
    func commonOverlapLength(with other: String) -> Int {
        var text1 = self
        var text2 = other
        // Cache the text lengths to prevent multiple calls.
        let length1 = text1.count
        let length2 = text2.count
        
        // Eliminate the null case.
        if length1 == 0 || length2 == 0 {
            return 0
        }
        
        // Truncate the longer string.
        if length1 > length2 {
            text1 = text1.substring(from: length1 - length2)
        } else if length1 < length2 {
            text2 = text2.substring(to: length1)
        }
        
        let minLength = min(length1, length2)
        // Quick check for the worst case.
        if text1 == text2 {
            return minLength
        }
        
        // Start by looking for a single character match
        // and increase length until no match is found.
        // Performance analysis: http://neil.fraser.name/news/2010/11/04/
        var best = 0
        var length = 1
        while true {
            let pattern = text1.substring(from: minLength - length)
            guard let found = text2.index(of: pattern) else {
                return best
            }
            length += found
            if found == 0 || pattern == text2.substring(to: length) {
                best = length
                length += 1
            }
        }
    }
}
