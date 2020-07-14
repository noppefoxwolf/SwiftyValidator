//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2020/07/14.
//

import Foundation

public struct GroupedValidator<Value>: Validatable {
    public enum Error: Swift.Error {
        case errors([Swift.Error])
    }
    
    let validators: [AnyValidator<Value>]
    
    init(validators: [AnyValidator<Value>]) {
        self.validators = validators
    }
    
    public func validate(value: Value) -> Result<Value, ValidationError> {
        var errors: [ValidationError] = []
        for result in validators.map({ $0.validate(value: value) }) {
            switch result {
            case .success:
                break
            case let .failure(error):
                errors.append(error)
            }
        }
        if errors.isEmpty {
            return .success(value)
        } else {
            let errors = errors.reduce(into: [Swift.Error](), {
                $0.append(contentsOf: $1.errors)
            })
            return .failure(.init(errors))
        }
    }
}

