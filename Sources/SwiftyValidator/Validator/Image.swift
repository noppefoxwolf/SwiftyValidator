//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2020/07/14.
//

#if canImport(UIKit)
import UIKit

struct ImageSizeValidator: Validatable {
    typealias Value = UIImage
    enum Error: Swift.Error {
        case invalidSize
    }
    let size: CGSize
    public init(size: CGSize) {
        self.size = size
    }
    
    
    func validate(value: Value) -> Result<Value, Swift.Error> {
        if value.size.width == size.width && value.size.height == size.height {
            return .success(value)
        } else {
            return .failure(Error.invalidSize)
        }
    }
}

#endif
