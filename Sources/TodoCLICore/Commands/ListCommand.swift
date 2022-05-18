//
//  ListCommand.swift
//  
//
//  Created by waheedCodes on 18/05/2022.
//

import Foundation
import ArgumentParser

struct ListCommand: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "list",
        abstract: "List the already registered todos."
    )

    func run() throws {
        let todos: [Todo] = TodoCLIStore().getTodos()
        
        debugPrint(todos)
    }
}
