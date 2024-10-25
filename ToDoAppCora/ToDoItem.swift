
import Foundation


import Foundation

struct ToDoItem: Identifiable {
    let id = UUID() 
    let name: String
    let category: String
    let deadline: Date
}

//try
