//
//  Subscript.swift
//  
//
//  Created by Arthur Guiot on 6/24/22.
//

import Foundation


extension String {
    
    subscript(range: Range<Int>) -> String {
        guard !range.isEmpty else {
            return ""
        }
        
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = index(self.startIndex, offsetBy: range.upperBound - 1)
        return String(self[startIndex...endIndex])
    }
    
    func substring(to offset: Int) -> String {
        let index = self.index(startIndex,
                               offsetBy: max(offset, 0),
                               limitedBy: endIndex) ?? endIndex
        return String(self[startIndex..<index])
    }
    
    func substring(from offset: Int) -> String {
        let index = self.index(startIndex,
                               offsetBy: max(offset, 0),
                               limitedBy: endIndex) ?? endIndex
        return String(self[index..<endIndex])
    }
    
    func substring(last count: Int) -> String {
        let index = self.index(endIndex,
                               offsetBy: min(-count, 0),
                               limitedBy: startIndex) ?? startIndex
        return String(self[index..<endIndex])
    }
    
    func index(of: String, from: Int = 0) -> Int? {
        let startIndex = index(self.startIndex, offsetBy: from)
        
        guard let range = self.range(of: of,
                                     options: [],
                                     range: startIndex..<endIndex) else {
            return nil
        }
        
        return distance(from: self.startIndex,
                                   to: range.lowerBound)
    }
}
