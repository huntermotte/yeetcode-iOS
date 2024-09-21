//
//  YeetcodeApp.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/18/24.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct YeetcodeApp: App {
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
      @State private var path = NavigationPath()

    var body: some Scene {
//        WindowGroup {
//            Login()
//        }
        WindowGroup {
          NavigationStack {
            AuthenticatedView {
              Image(systemName: "number.circle.fill")
                .resizable()
                .frame(width: 100 , height: 100)
                .foregroundColor(Color(.systemPink))
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .clipped()
                .padding(4)
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
              Text("Welcome to Yeetcode")
                .font(.title)
              Text("You need to be logged in to use this app.")
            } content: {
                ProblemsScreen(path: $path)
                Spacer()
            }
          }
        }
    }
}
