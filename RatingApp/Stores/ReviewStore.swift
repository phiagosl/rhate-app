//
//  ReviewStore.swift
//  RatingApp
//
//  Created by Pedro Lima on 04/09/25.
//


import Foundation

class ReviewStore: ObservableObject {
    @Published var reviews: [Review] = [
        Review(author: "Alice", rating: 5, comment: "Ótimo trabalho!", approved: true),
        Review(author: "Bob", rating: 4, comment: "Muito prestativo.", approved: true)
    ]
    
    var approvedReviews: [Review] {
        reviews.filter { $0.approved }
    }
    
    var pendingReviews: [Review] {
        reviews.filter { !$0.approved }
    }
    
    var averageRating: Double {
        guard !approvedReviews.isEmpty else { return 0 }
        let sum = approvedReviews.reduce(0) { $0 + $1.rating }
        return Double(sum) / Double(approvedReviews.count)
    }
    
    func addReview(author: String, rating: Int, comment: String) {
        let newReview = Review(author: author, rating: rating, comment: comment, approved: false)
        reviews.append(newReview)
    }
    
    func approveReview(_ review: Review) {
        if let index = reviews.firstIndex(where: { $0.id == review.id }) {
            reviews[index].approved = true
        }
    }
    
    func rejectReview(_ review: Review) {
        reviews.removeAll { $0.id == review.id }
    }
}
