//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2020/07/14.
//

import Foundation

public struct ValidationError: Error {
    let errors: [Swift.Error]
    
    init(_ errors: [Swift.Error]) {
        self.errors = errors
    }
}
