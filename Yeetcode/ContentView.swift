//
//  ContentView.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/18/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var problemModel = ProblemModel()
    
    var body: some View {
        NavigationView {
            VStack {
            
                ForEach(problemModel.problems, id: \.self) { problem in
                    ProblemRow(
                        name: problem.name,
                        difficulty: problem.difficulty
                    )
                    .padding(3)
                }
                
                Spacer()
                
                NavigationLink(
                    destination: SecondScreen(),
                    label: {
                        ContinueButton(color: .mint)
                    })
            }
            .navigationTitle("Problems")
            .onAppear {
                problemModel.fetch()
            }
        }
    }
}

struct ContinueButton: View {
    
    let color: Color
    
    var body: some View {
        Text("Continue")
            .frame(
                width: 200,
                height: 50,
                alignment: .center
            )
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

#Preview {
    ContentView()
}
