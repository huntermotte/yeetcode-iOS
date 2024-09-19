//
//  LogoutButton.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/19/24.
//
import SwiftUI

struct LogoutButton: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        Button {
            path = NavigationPath()
        } label: {
            Text("go to root view")
        }
    }
}
