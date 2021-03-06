//
//  TodoCLIStoreTests.swift
//  
//
//  Created by waheedCodes on 19/05/2022.
//

@testable import TodoCLICore
import XCTest

class TodoCLIStoreTests: XCTestCase {

    var sut: TodoCLIStore!

    override func setUpWithError() throws {
        sut = TodoCLIStore(filename: "sampleStore")
    }

    override func tearDownWithError() throws {
        sut = nil
        let url = FileManager.default.documentsURL(name: "sampleStore")
        try? FileManager.default.removeItem(at: url)
    }

    func test_add_whenTodoIsAdded_shouldIncreaseTodoCountByOne() {
        let todo = Todo(title: "a todo")
        sut.add(todo)
        let initialTodosCount = sut.getTodos().count
        XCTAssertEqual(initialTodosCount, 1)

        let newTodo = Todo(title: "another todo")
        sut.add(newTodo)
        let newTodosCount = sut.getTodos().count
        let exoectedTodosCount = initialTodosCount + 1

        XCTAssertEqual(newTodosCount, exoectedTodosCount)
    }

    func test_add_shouldAddTodo() {
        let todo = Todo(title: "a todo")

        sut.add(todo)
        let todos = sut.getTodos()

        XCTAssertTrue(todos.contains(todo))
    }

    func test_add_whenAnAlreadyAddedTodoisAdded_shouldNotBeAdded() {
        let todo = Todo(title: "a todo")
        sut.add(todo)
        let todosBefore = sut.getTodos()
        let numberOfTodos = todosBefore.count

        let anotherTodoWithSameTitle = Todo(title: "a todo")
        sut.add(anotherTodoWithSameTitle)
        let todosAfter = sut.getTodos()
        let expectedNumberOfTodos = todosAfter.count

        XCTAssertEqual(numberOfTodos, expectedNumberOfTodos)
    }

    func test_delete_whenSpecificTodoNumberIsProvided_shouldRemoveTheTodo() throws {
        let todo = Todo(title: "a todo")
        sut.add(todo)
        let expectedNumberOfTodos = sut.getTodos().count
        XCTAssertEqual(expectedNumberOfTodos, 1)

        let indexOfTodo = try XCTUnwrap(sut.getTodos().firstIndex(of: todo)) + 1
        sut.deleteTodo(at: indexOfTodo)
        let expectedNumberOfTodosAfter = sut.getTodos().count

        XCTAssertEqual(expectedNumberOfTodosAfter, 0)
    }

    func test_getTodos_shouldReturnAlreadyAddedTodos() {
        let todos: [Todo] = [
            .init(title: "first todo"),
            .init(title: "second todo"),
            .init(title: "third todo")
        ]

        todos.forEach { sut.add($0) }
        let currentTodos = sut.getTodos()

        XCTAssertEqual(currentTodos, todos)
    }
}
