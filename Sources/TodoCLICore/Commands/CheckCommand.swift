//
//  CheckCommand.swift
//  
//
//  Created by waheedCodes on 19/05/2022.
//

import Foundation
import ArgumentParser

struct CheckCommand: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "complete",
        abstract: "Marks a specific todo as completed."
    )

    @Argument(help: "Check a todo as completed.")
    private var id: Int

    func run() throws {
        let sharedInstance = TodoCLIStore.shared
        sharedInstance.checkTodo(at: id)
    }
}
