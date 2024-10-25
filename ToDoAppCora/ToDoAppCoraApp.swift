
import SwiftUI

@main

struct ToDoAppCoraApp: App {
    
    @StateObject private var toDoModel = ToDoModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(toDoModel)

        }
    }
}
