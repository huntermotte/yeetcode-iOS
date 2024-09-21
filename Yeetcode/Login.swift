//
//  ContentView.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/18/24.
//

import SwiftUI

struct Login: View {
    @State private var path = NavigationPath()
    @StateObject private var viewModel = AuthenticationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                
                Button(action: {
                    signInWithGoogle()
                }) {
                    GoogleSignInButton()
                        .frame(width: 280, height: 45)
                        .padding()
                }
                
                Button {
                } label: {
                    NavigationLink("Sign in with Google", value: "google")
                }
                
                Button {
                } label: {
                    NavigationLink("Sign in with Apple", value: "apple")
                }
            }
            .navigationDestination(for: String.self) { textValue in
                ProblemsScreen(path: $path)
            }
            .navigationDestination(for: Int.self) { numberValue in
                Text("Detail with \(numberValue)")
            }
             .navigationTitle("Login")
        }
    }
    
    private func signInWithGoogle() {
        Task {
          if await viewModel.signInWithGoogle() == true {
            dismiss()
          }
        }
      }
}

#Preview {
    Login()
}
