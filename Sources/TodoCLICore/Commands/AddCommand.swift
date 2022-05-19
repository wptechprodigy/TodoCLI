//
//  File.swift
//  
//
//  Created by waheedCodes on 18/05/2022.
//

import ArgumentParser
import Foundation

struct AddCommand: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "add",
        abstract: "Add a new todo to already saved todos."
    )

    @Argument(help: "The title of the todo")
    private var title: String

    @Option(name: .shortAndLong, help: "Specifies if this task has already been completed before been listed.")
    private var isCompleted: Bool = false

    func run() throws {
        let newTodo: Todo = Todo(title: title)
        let sharedStore = TodoCLIStore.shared
        sharedStore.add(newTodo)
    }
}
