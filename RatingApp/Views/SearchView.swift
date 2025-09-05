//
//  SearchView.swift
//  RatingApp
//
//  Created by Pedro Lima on 05/09/25.
//


import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    let users = ["Alice", "Bob", "Maria", "John Doe"] // Exemplo de lista de usuários
    
    var body: some View {
        VStack {
            TextField("Buscar usuário...", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .cornerRadius(10)
            
            List(users.filter { searchText.isEmpty ? true : $0.contains(searchText) }, id: \.self) { user in
                NavigationLink(destination: ProfileView()) {
                    Text(user)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                }
            }
        }
        .navigationTitle("Buscar Usuários")
    }
}
