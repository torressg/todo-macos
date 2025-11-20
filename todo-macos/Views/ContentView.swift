import SwiftUI

struct ContentView: View {

    @StateObject var vm = TodoViewModel()
    @State private var newSubjectTitle = ""
    
    func createSubject() {
        guard !newSubjectTitle.isEmpty else { return }
        vm.createSubject(title: newSubjectTitle)
        newSubjectTitle = ""
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    TextField("New subject...", text: $newSubjectTitle)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            createSubject()
                        }

                    Button("Create") {
                        createSubject()
                    }
                }
                .padding()

                List {
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
            }
            .navigationDestination(for: UUID.self) { subjectId in
                SubjectDetailView(subjectId: subjectId, viewModel: vm)
            }
            .navigationTitle("Subjects")
        }
    }
}
