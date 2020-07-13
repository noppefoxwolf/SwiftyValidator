//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2020/07/14.
//

import Foundation

public struct RequireValidator<V>: Validatable {
    public typealias Value = Optional<V>
    public enum Error: Swift.Error {
        case valueIsNil
    }
    let groupedValidator: GroupedValidator<V>
    
    public init(groupedValidator: GroupedValidator<V>) {
        self.groupedValidator = groupedValidator
    }
    
    public func validate(value: Value) -> Result<Value, Swift.Error> {
        if let unwrappedValue = value {
            switch groupedValidator.validate(value: unwrappedValue) {
            case .success:
                return .success(value)
            case let .failure(error):
                return .failure(error)
            }
        } else {
            return .failure(Error.valueIsNil)
        }
    }
}

