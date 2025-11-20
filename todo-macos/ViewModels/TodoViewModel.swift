import Foundation
import Combine
import SwiftUI

class TodoViewModel: ObservableObject {

    private let storageKey = "subjects_storage"

    @Published var subjects: [TodoSubject] = [] {
        didSet {
            save()
        }
    }

    init() {
        load()
    }

    func createSubject(title: String) {
        let newSubject = TodoSubject(title: title)
        subjects.append(newSubject)
    }

    func addTask(subjectId: UUID, task: Todo) {
        if let index = subjects.firstIndex(where: { $0.id == subjectId }) {
            subjects[index].tasks.append(task)
        }
    }

    func removeTasks(at offsets: IndexSet, from subjectId: UUID) {
        if let subjectIndex = subjects.firstIndex(where: { $0.id == subjectId }) {
            subjects[subjectIndex].tasks.remove(atOffsets: offsets)
        }
    }
    
    func removeSubject(_ subjectId: UUID) {
        subjects.removeAll(where: { $0.id == subjectId })
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(subjects) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([TodoSubject].self, from: data) {
            subjects = decoded
        }
    }
}
