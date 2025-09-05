//
//  ProfileView.swift
//  RatingApp
//
//  Created by Pedro Lima on 04/09/25.
//


import SwiftUI

struct ProfileView: View {
    @StateObject private var store = ReviewStore()
    let username = "John Doe"
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .overlay(Text("JD").font(.title).foregroundColor(.white))
                .padding(.bottom, 20)
            
            Text(username)
                .font(.title)
                .bold()
            
            Text("⭐️ \(String(format: "%.1f", store.averageRating))")
                .font(.headline)
                .padding(.bottom, 20)
            
            List {
                Section(header: Text("Avaliações")) {
                    ForEach(store.approvedReviews) { review in
                        ReviewRow(author: review.author, rating: review.rating, comment: review.comment)
                    }
                }
            }
            
            VStack(spacing: 10) {
                if let pending = store.pendingReviews.first {
                    NavigationLink(destination: ApproveCommentView(review: pending, store: store)) {
                        Text("Ver nova avaliação")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                NavigationLink(destination: RateUserView(username: "Maria", store: store)) {
                    Text("Avaliar outro usuário")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
