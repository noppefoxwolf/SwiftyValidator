//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2020/07/14.
//

import Foundation

public struct StringCountRangeValidator: Validatable {
    public enum Error: Swift.Error {
        case textCountOutOfBounds
    }
    let validRange: CountableClosedRange<Int>
    
    public init(validRange: CountableClosedRange<Int>) {
        self.validRange = validRange
    }
    
    public func validate(value: String) -> Result<String, Swift.Error> {
        if validRange ~= value.count {
            return .success(value)
        } else {
            return .failure(Error.textCountOutOfBounds)
        }
    }
}

public struct StringCountValidator: Validatable {
    public enum Error: Swift.Error {
        case textCountOutOfBounds
    }
    let validCount: Int
    
    public init(validCount: Int) {
        self.validCount = validCount
    }
    
    public func validate(value: String) -> Result<String, Swift.Error> {
        if validCount == value.count {
            return .success(value)
        } else {
            return .failure(Error.textCountOutOfBounds)
        }
    }
}
