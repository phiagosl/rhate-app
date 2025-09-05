//
//  Review.swift
//  RatingApp
//
//  Created by Pedro Lima on 04/09/25.
//


import Foundation

struct Review: Identifiable {
    let id = UUID()
    let author: String
    let rating: Int
    let comment: String
    var approved: Bool = false
}
