//
//  ProblemsScreen.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/19/24.
//
import SwiftUI

struct ProblemsScreen: View {
    @StateObject var problemModel = ProblemModel()
    @Binding var path: NavigationPath
    
    var body: some View {
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
                destination: SecondScreen(path: $path),
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
