//
//  ContentView.swift
//  Bookworm
//
//  Created by Zach Mommaerts on 10/24/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
