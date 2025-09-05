//
//  RateUserView.swift
//  RatingApp
//
//  Created by Pedro Lima on 04/09/25.
//


import SwiftUI

struct RateUserView: View {
    let username: String
    @ObservedObject var store: ReviewStore
    
    @State private var rating = 3
    @State private var comment = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Avaliar \(username)")
                .font(.title)
                .bold()
            
            Stepper("Nota: ⭐️ \(rating)", value: $rating, in: 1...5)
                .padding()
            
            TextEditor(text: $comment)
                .frame(height: 120)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5))
                )
                .padding(.horizontal)
            
            Button("Enviar avaliação") {
                store.addReview(author: "Você", rating: rating, comment: comment)
                dismiss()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .padding()
    }
}
