import Foundation
import Combine
import SwiftUI

class TodoViewModel: ObservableObject {

    private let storageKey = "todos_storage"

    @Published var todos: [Todo] = [] {
        didSet {
            save()
        }
    }

    init() {
        load()
    }

    func add(title: String) {
        let newTodo = Todo(title: title)
        todos.append(newTodo)
    }

    func remove(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([Todo].self, from: data) {
            todos = decoded
        }
    }
}
