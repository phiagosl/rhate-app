//
//  ApproveCommentView.swift
//  RatingApp
//
//  Created by Pedro Lima on 04/09/25.
//


import SwiftUI

struct ApproveCommentView: View {
    let review: Review
    @ObservedObject var store: ReviewStore
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Nova Avaliação")
                .font(.title)
                .bold()
            
            Text("Nota recebida: ⭐️ \(review.rating)")
                .font(.headline)
            
            Text("Comentário recebido:")
                .font(.subheadline)
            
            Text("***************") // censurado
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            HStack {
                Button("Aceitar") {
                    store.approveReview(review)
                    dismiss()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Rejeitar") {
                    store.rejectReview(review)
                    dismiss()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}
