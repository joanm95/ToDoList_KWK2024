//
//  ContentView.swift
//  ToDoList
//
//  Created by joan on 5/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var showNewTask = false
    
    @Query var toDos: [ToDoItem]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                
                Spacer()
                
                Button{
                    withAnimation {
                        self.showNewTask = true
                    }
                    
                } label : {
                    Text("+")
                        .font(.title)
                        .bold()
                }
            }
            .padding()
            
            Spacer()
            
            List {
                ForEach(toDos){ toDoItem in
                    if toDoItem.isImportant == true{
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                    
                }
                .onDelete(perform: deleteToDo)
            }
            .listStyle(.plain)
            
        }
        if showNewTask {
            NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
        }
        
    }
    
    func deleteToDo(at offsets: IndexSet){
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
    
}

#Preview {
    ContentView()
}
