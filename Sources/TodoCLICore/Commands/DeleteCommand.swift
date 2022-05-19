//
//  DeleteCommand.swift
//  
//
//  Created by waheedCodes on 18/05/2022.
//

import Foundation
import ArgumentParser

struct DeleteCommand: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "delete",
        abstract: "Delete a specific todo from saved todos."
    )

    @Argument(help: "The id of the todo to be deleted.")
    private var id: Int

    func run() throws {
        let sharedInstance = TodoCLIStore.shared
        sharedInstance.deleteTodo(at: id)
    }
}
