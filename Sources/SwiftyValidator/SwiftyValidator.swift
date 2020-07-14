//
//  Validator.swift
//  SwiftyValidator
//
//  Created by Tomoya Hirano on 2020/07/14.
//

import Foundation

public protocol Validatable {
    associatedtype Value
    func validate(value: Value) -> Result<Value, ValidationError>
}

public extension Validatable {
    func erase() -> AnyValidator<Value> {
        AnyValidator(validator: self)
    }
}
