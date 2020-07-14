//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2020/07/14.
//

import Foundation

@propertyWrapper
public struct Validation<Value> {
    private let validator: AnyValidator<Value>
    public var wrappedValue: Value
    
    public init<V: Validatable>(wrappedValue: Value, _ validator: V) where V.Value == Value {
        self.wrappedValue = wrappedValue
        self.validator = validator.erase()
    }
    
    public func validate() -> Result<Value, ValidationError> {
        validator.validate(value: wrappedValue)
    }
    
    public var isValid: Bool {
        validator.validate(value: wrappedValue).isSuccess
    }
}
