
import SwiftUI

struct AddToDoView: View {
    @EnvironmentObject var toDoModel: ToDoModel
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var category = "Other"
    @State private var deadline = Date()

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("To-Do Details")) {
                    TextField("Name", text: $name)
                    Picker("Category", selection: $category) {
                        ForEach(["Shopping", "Work", "Other"], id: \.self) { category in
                            Text(category)
                        }
                    }
                    DatePicker("Deadline", selection: $deadline, in: Date()... , displayedComponents: .date)
                }
                
                Button("Save") {
                    toDoModel.addItem(name: name, category: category, deadline: deadline)
                    dismiss()
                }
                .disabled(name.isEmpty)
            }
            .navigationTitle("Add To-Do")
        }
    }
}


#Preview {
    AddToDoView()
}
