//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2020/07/14.
//

import Foundation

@propertyWrapper
public struct Validation<Value> {
    private var validatableValue: ValidatableValue<Value>
    public var wrappedValue: Value {
        get { validatableValue.value }
        set { validatableValue.value = newValue }
    }
    
    public init<V: Validatable>(wrappedValue: Value, _ validator: V) where V.Value == Value {
        validatableValue = .init(value: wrappedValue, validator: validator)
    }
    
    public func validate() -> Result<Value, Error> {
        validatableValue.validate()
    }
    
    public var isValid: Bool {
        validatableValue.isValid
    }
}
