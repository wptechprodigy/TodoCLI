//
//  File.swift
//  
//
//  Created by waheedCodes on 18/05/2022.
//

import ArgumentParser
import Foundation

public struct TodoCLI: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "todo",
        abstract: "A Swift command-line Todo App tool to manage todos",
        subcommands: []
    )

    public init() {}
}
