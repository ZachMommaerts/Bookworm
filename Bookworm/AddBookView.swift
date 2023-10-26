//
//  AddBookView.swift
//  Bookworm
//
//  Created by Zach Mommaerts on 10/25/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var rating = 3
    @State private var review = ""
    
    let genres = ["", "Fantasy", "Horror", "Kids", "Mystery", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.genre = genre
                        newBook.rating = Int16(rating)
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                }
                .disabled(validateBook() == false)
            }
            .navigationTitle("Add Book")
        }
    }
    
    func validateBook() -> Bool {
        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || genre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || review.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        } else {
            return true
        }
    }
}

#Preview {
    AddBookView()
}
