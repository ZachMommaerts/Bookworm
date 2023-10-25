//
//  ContentView.swift
//  Bookworm
//
//  Created by Zach Mommaerts on 10/24/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "unknown")
            }
            
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermoine", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

#Preview {
    ContentView()
}
