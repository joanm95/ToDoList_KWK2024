//
//  NewToDoView.swift
//  ToDoList
//
//  Created by joan on 5/12/24.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    
    @Binding var showNewTask : Bool
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        
        VStack {
            
            Text("Task title:")
                .font(.title2)
                .fontWeight(.bold)
            
            TextField("Enter the task description", text: $toDoItem.title, axis:.vertical)
                .padding()
                .cornerRadius(15)
                .padding()
        
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is this task important?")
            }
            
            Button{
                addToDo()
                self.showNewTask = false
            } label: {
                Text("Save Task")
            }
        }
        .padding()
        
    }
    
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ToDoItem.self, configurations: config)

    let toDo = ToDoItem(title: "Example ToDo", isImportant: false)
    return NewToDoView(showNewTask: .constant(true), toDoItem: toDo)
        .modelContainer(container)
}
