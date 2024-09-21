//
//  GoogleSignIn.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/19/24.
//
import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

struct GoogleSignInButton: UIViewRepresentable {
    func makeUIView(context: Context) -> GIDSignInButton {
        return GIDSignInButton()
    }

    func updateUIView(_ uiView: GIDSignInButton, context: Context) {}

    func signInWithGoogle() {
        guard let presentingViewController = UIApplication.shared.windows.first?.rootViewController else {
            return
        }
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create GIDConfiguration object with the clientID
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
              // check `error`; do something with `signInResult`
            if let error = error {
                print("Error with Google Sign-In: \(error)")
                return
            }

            guard let accessToken = signInResult?.user.accessToken, let idToken = signInResult?.user.idToken else {
                print("Google Sign-In authentication failed.")
                return
            }

            // Get the credentials to sign in with Firebase
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)

            // Use Firebase Authentication with Google credentials
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Sign-In Error: \(error)")
                    return
                }
                print("User signed in with Google!")
            }
          }
    }
}


