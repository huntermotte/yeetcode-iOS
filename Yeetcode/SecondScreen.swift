//
//  SecondScreen.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/18/24.
//
import SwiftUI

struct SecondScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Image(systemName: "bell")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200,
                       height: 200,
                       alignment: .center)
                .padding()
            
            Text("Go to problem details")
                .font(.system(size: 30, weight: .light, design: .default))
                .padding()
            
            NavigationLink(
                destination: Text("hello world"),
                label: {
                    ContinueButton(color: .pink)
                })
        }
        .navigationTitle("Notis")
    }
}
