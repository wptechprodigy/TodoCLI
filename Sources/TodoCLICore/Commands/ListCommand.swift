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

        if todos.count > 0 {
            for (index, todo) in todos.enumerated() {
                todo.isCompleted ? print("(\(index)*) \(todo)") : print("(\(index)) \(todo)")
            }
        } else {
            debugPrint(todos)
        }
    }
}
