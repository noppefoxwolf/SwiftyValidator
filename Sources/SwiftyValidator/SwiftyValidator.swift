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

public struct ValidatableValue<Value> {
    public var value: Value
    let validator: AnyValidator<Value>
    
    public init<Validator: Validatable>(value: Value, validator: Validator) where Validator.Value == Value {
        self.value = value
        self.validator = validator.erase()
    }
    
    public func validate() -> Result<Value, ValidationError> { validator.validate(value: value) }
    public var isValid: Bool { validate().isSuccess }
}

public extension Validatable {
    func erase() -> AnyValidator<Value> {
        AnyValidator(validator: self)
    }
}
