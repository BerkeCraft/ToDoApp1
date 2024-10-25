
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var toDoModel: ToDoModel
    @State private var selectedCategory: String? = nil
    @State private var showAddView = false

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Filter by Category", selection: $selectedCategory) {
                    Text("All").tag(String?.none)
                    ForEach(["Shopping", "Work", "Other"], id: \.self) { category in
                        Text(category).tag(String?(category))
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                List {
                    ForEach(filteredItems) { item in
                        VStack(alignment: .leading) {
                            Text(item.name).font(.headline)
                            Text(item.deadline, style: .date).font(.subheadline)
                        }
                    }
                }
                
                Button(action: { showAddView.toggle() }) {
                    Text("Add To-Do")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $showAddView) {
                    AddToDoView()
                        .environmentObject(toDoModel)
                }
            }
            .navigationTitle("To Do List")
        }
    }
    
    var filteredItems: [ToDoItem] {
        if let category = selectedCategory {
            return toDoModel.items(for: category)
        } else {
            return toDoModel.items
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ToDoModel())
    }
}
