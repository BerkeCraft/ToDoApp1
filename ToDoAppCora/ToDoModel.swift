
import Foundation
import Combine
import SwiftUI


class ToDoModel: ObservableObject {
    @Published var items: [ToDoItem] = []
    
    func addItem(name: String, category: String, deadline: Date) {
        let newItem = ToDoItem(name: name, category: category, deadline: deadline)
        items.append(newItem)
    }
    
    func items(for category: String) -> [ToDoItem] {
        return items.filter { $0.category == category }
    }
}

