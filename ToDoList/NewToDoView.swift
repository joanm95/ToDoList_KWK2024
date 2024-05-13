//
//  NewToDoView.swift
//  ToDoList
//
//  Created by joan on 5/12/24.
//

import SwiftUI

struct NewToDoView: View {
    var body: some View {
        
        VStack {
            
            Text("Task title:")
                .font(.title2)
                .fontWeight(.bold)
            
            TextField("Enter the task description", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .cornerRadius(15)
                .padding()
        
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                Text("Is this task important?")
            }
            
            Button{
            } label: {
                Text("Save Task")
            }
        }
        .padding()
        
    }
}

#Preview {
    NewToDoView()
}
