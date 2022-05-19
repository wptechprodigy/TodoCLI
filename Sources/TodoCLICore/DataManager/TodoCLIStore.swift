//
//  TodoCLIStore.swift
//  
//
//  Created by waheedCodes on 18/05/2022.
//

import Foundation

protocol ItemStorable {
    func add(_ todo: Todo)
    func checkTodo(at index: Int)
    func deleteTodo(at index: Int)
}

final class TodoCLIStore: ItemStorable {

    static let shared: TodoCLIStore = TodoCLIStore()

    // MARK: - Properties
    private lazy var todoList: [Todo] = {
        let url = storageManager.documentsURL(name: filename)

        do {
            let data = try Data(contentsOf: url)
            let todoList = try JSONDecoder().decode([Todo].self, from: data)
            return todoList
        } catch {
            print("Error while reading from file: \(error)")
            return []
        }
    }()

    private let filename: String = "MyTodos"
    private let storageManager: StoreManagable = FileManager.default

    // MARK: - Initializer
    private init() {}

    // MARK: - Helper methods
    func getTodos() -> [Todo] {
        return todoList
    }

    func add(_ todo: Todo) {
        if todoList.contains(todo) {
            
        }
        todoList.append(todo)
        save(todoList)
    }

    func checkTodo(at index: Int) {
        let actualIndex = index - 1
        guard var completedTodo = todoList[safe: actualIndex] else { return }
        completedTodo.isCompleted = true

        todoList[actualIndex] = completedTodo
        save(todoList)
    }

    func deleteTodo(at index: Int) {
        let actualIndex = index - 1

        if todoList[safe: actualIndex] != nil {
            todoList.remove(at: actualIndex)
            save(todoList)
        }
    }

    // MARK: - Private helpers
    private func save(_ todos: [Todo]) {
        let url = storageManager.documentsURL(name: filename)
        
        do {
            let data = try JSONEncoder().encode(todos)
            try data.write(to: url)
        } catch {
            print("Error while writing to file: \(error)")
        }
    }
}
