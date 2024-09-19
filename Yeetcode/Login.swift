//
//  ContentView.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/18/24.
//

import SwiftUI

struct Login: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
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
}

#Preview {
    Login()
}
