import Foundation

struct TodoSubject: Identifiable, Codable {
    let id: UUID
    var title: String
    var tasks: [Todo]
    
    init(id: UUID = UUID(), title: String, tasks: [Todo] = []) {
        self.id = id
        self.title = title
        self.tasks = tasks
    }
}