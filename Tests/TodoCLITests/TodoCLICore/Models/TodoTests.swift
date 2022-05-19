//
//  TodoTests.swift
//  
//
//  Created by waheedCodes on 19/05/2022.
//

@testable import TodoCLICore
import XCTest

class TodoTests: XCTestCase {

    func test_init_whenCreated_setsId() {
        let todo = Todo(title: "a todo")
        let dummyTodoId = todo.id

        XCTAssertEqual(todo.id, dummyTodoId)
    }

    func test_init_whenGivenTitle_setsTitle() {
        let todo = Todo(title: "a todo")

        XCTAssertEqual(todo.title, "a todo")
    }

    func test_init_whenMarkedCompleted_setsTodoAsCompleted() {
        var todo = Todo(title: "a todo")
        XCTAssertFalse(todo.isCompleted)

        todo.isCompleted = true

        XCTAssertTrue(todo.isCompleted)
    }
}
