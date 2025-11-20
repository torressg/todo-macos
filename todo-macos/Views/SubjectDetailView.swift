import SwiftUI

struct SubjectDetailView: View {
    
    @ObservedObject var vm: TodoViewModel
    @State private var selectedSubjectId: UUID?
    @State private var newTaskTitle = ""
    
    let initialSubjectId: UUID
    
    init(subjectId: UUID, viewModel: TodoViewModel) {
        self.initialSubjectId = subjectId
        _selectedSubjectId = State(initialValue: subjectId)
        _vm = ObservedObject(wrappedValue: viewModel)
    }
    
    var selectedSubject: TodoSubject? {
        vm.subjects.first(where: { $0.id == selectedSubjectId })
    }
    
    func addTask() {
        guard !newTaskTitle.isEmpty, let subjectId = selectedSubjectId else { return }
        vm.addTask(subjectId: subjectId, task: Todo(title: newTaskTitle))
        newTaskTitle = ""
    }
    
    func toggle(_ task: Todo) {
        guard let subjectId = selectedSubjectId else { return }
        if let index = vm.subjects.firstIndex(where: { $0.id == subjectId }) {
            if let taskIndex = vm.subjects[index].tasks.firstIndex(where: { $0.id == task.id }) {
                vm.subjects[index].tasks[taskIndex].isDone.toggle()
            }
        }
    }

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedSubjectId) {
                ForEach(vm.subjects) { subject in
                    NavigationLink(value: subject.id) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(subject.title)
                                .font(.headline)
                            Text("\(subject.tasks.count) tasks")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Subjects")
        } detail: {
            Group {
                if let subject = selectedSubject {
                    NavigationStack {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                TextField("New task...", text: $newTaskTitle)
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
                                ForEach(subject.tasks) { task in
                                    HStack {
                                        Button {
                                            toggle(task)
                                        } label: {
                                            Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                                        }
                                        .buttonStyle(.borderless)
                                        
                                        Text(task.title)
                                            .strikethrough(task.isDone)
                                        
                                        Button {
                                            if let subjectIndex = vm.subjects.firstIndex(where: { $0.id == subject.id }),
                                                let taskIndex = vm.subjects[subjectIndex].tasks.firstIndex(where: { $0.id == task.id }) {
                                                    vm.removeTasks(at: IndexSet(integer: taskIndex), from: subject.id)
                                            }
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                        .buttonStyle(.borderless)
                                    }
                                }
                                .onDelete { offsets in
                                    vm.removeTasks(at: offsets, from: subject.id)
                                }
                            }
                        }
                        .navigationTitle(subject.title)
                    }
                } else {
                    Text("Selecione um subject")
                        .foregroundColor(.secondary)
                }
            }
        }
        .onAppear {
            if selectedSubjectId == nil {
                selectedSubjectId = initialSubjectId
            }
        }
    }
}

