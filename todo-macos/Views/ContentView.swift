import SwiftUI

struct ContentView: View {

    @StateObject var vm = TodoViewModel()
    @State private var newTask = ""
    
    func addTask() {
        guard !newTask.isEmpty else { return }
        vm.add(title: newTask)
        newTask = ""
    }

    var body: some View {
        VStack(alignment: .leading) {

            HStack {
                TextField("New task...", text: $newTask)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        addTask()
                    }

                Button("Add") {
                    addTask()
                }
            }
            .padding()

            List {
                ForEach(vm.todos) { todo in
                    HStack {
                        Button {
                            toggle(todo)
                        } label: {
                            Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                        }
                        .buttonStyle(.borderless)

                        Text(todo.title)
                            .strikethrough(todo.isDone)
                    }
                }
                .onDelete(perform: vm.remove)
            }
        }
        .padding()
    }

    func toggle(_ todo: Todo) {
        if let index = vm.todos.firstIndex(where: { $0.id == todo.id }) {
            vm.todos[index].isDone.toggle()
        }
    }
}
