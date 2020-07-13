//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2020/07/14.
//

import Foundation

public struct AnyValidator<Value>: Validatable {
    private let _validate: (Value) -> Result<Value, Error>
    
    public init<T: Validatable>(validator: T) where T.Value == Value {
        self._validate = { validator.validate(value: $0) }
    }
    
    public func validate(value: Value) -> Result<Value, Error> {
        _validate(value)
    }
}
