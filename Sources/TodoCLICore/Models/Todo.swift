//
//  Todo.swift
//  
//
//  Created by waheedCodes on 18/05/2022.
//

import Foundation

struct Todo: Codable, Hashable {
    let id: String
    let title: String
    var isCompleted: Bool = false

    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
    }

    static func == (lhs: Todo,
            rhs: Todo) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Todo {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
