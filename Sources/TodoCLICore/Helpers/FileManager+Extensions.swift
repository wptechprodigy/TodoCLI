//
//  FileManager+Extensions.swift
//  
//
//  Created by waheedCodes on 18/05/2022.
//

import Foundation

protocol StoreManagable {
    func documentsURL(name: String) -> URL
}

extension FileManager: StoreManagable {
    func documentsURL(name: String) -> URL {
        guard let documentURL = urls(
            for: .documentDirectory,
               in: .userDomainMask).first
        else {
            fatalError()
        }

        return documentURL.appendingPathComponent(name)
    }
}
