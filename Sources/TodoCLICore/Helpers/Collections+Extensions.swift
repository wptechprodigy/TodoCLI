//
//  File.swift
//  
//
//  Created by waheedCodes on 18/05/2022.
//

import Foundation

extension Collection {
    /// Returns the element at the given index
    /// if it is within range, otherwise nil
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
