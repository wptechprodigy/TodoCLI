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

    // MARK: - Properties
    private var todoList: [Todo] = []

    private let filename: String
    private let storageManager: StoreManagable

    // MARK: - Initializer
    init(filename: String = "MyTodos",
         storageManager: StoreManagable = FileManager.default) {
        self.filename = filename
        self.storageManager = storageManager
    }

    // MARK: - Helper methods
    func getTodos() -> [Todo] {
        saveTodo()
        loadTodos()
        return todoList
    }

    func add(_ todo: Todo) {
        todoList.append(todo)
        saveTodo()
    }

    func checkTodo(at index: Int) {
        guard var completedTodo = todoList[safe: index] else { return }
        completedTodo.isCompleted = true

        todoList[index] = completedTodo
        saveTodo()
    }

    func deleteTodo(at index: Int) {
        if todoList[safe: index] != nil {
            todoList.remove(at: index)
            saveTodo()
        }
    }

    // MARK: - Private helpers
    private func saveTodo() {
        let url = storageManager.documentsURL(name: filename)

        do {
            let data = try JSONEncoder().encode(todoList)
            try data.write(to: url)
        } catch {
            print("Error while writing to file: \(error)")
        }
    }

    private func loadTodos() {
        let url = storageManager.documentsURL(name: filename)
        
        do {
            let data = try Data(contentsOf: url)
            todoList = try JSONDecoder().decode([Todo].self, from: data)
        } catch {
            print("Error while reading from file: \(error)")
        }
    }
}
