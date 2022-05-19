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
        abstract: "Lists the already saved todos."
    )

    func run() throws {
        let sharedStore = TodoCLIStore.shared
        let todos: [Todo] = sharedStore.getTodos()

        if todos.count > 0 {
            for (index, todo) in todos.enumerated() {
                todo.isCompleted ? print("(\(index + 1)*) \(todo.title)") : print("(\(index + 1)) \(todo.title)")
            }
        } else {
            debugPrint(todos)
        }
    }
}
