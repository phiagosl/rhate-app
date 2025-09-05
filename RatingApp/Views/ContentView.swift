import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoggedIn {
                    if selectedTab == 0 {
                        ProfileView()
                    } else if selectedTab == 1 {
                        SearchView()
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button(action: { selectedTab = 0 }) {
                            Text("Perfil")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        Spacer()
                        Button(action: { selectedTab = 1 }) {
                            Text("Buscar Usuário")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                } else {
                    LoginView(isLoggedIn: $isLoggedIn)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

