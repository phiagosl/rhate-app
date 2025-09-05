//
//  ReviewRow.swift
//  RatingApp
//
//  Created by Pedro Lima on 04/09/25.
//


import SwiftUI

struct ReviewRow: View {
    let author: String
    let rating: Int
    let comment: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(author).bold()
                Spacer()
                Text("⭐️ \(rating)")
            }
            Text(comment)
        }
        .padding(.vertical, 5)
    }
}
