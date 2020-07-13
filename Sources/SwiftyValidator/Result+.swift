//
//  Result+.swift
//  
//
//  Created by Tomoya Hirano on 2020/07/14.
//

import Foundation

extension Result {
    var isSuccess: Bool {
        if case .success = self {
            return true
        } else {
            return false
        }
    }
}

