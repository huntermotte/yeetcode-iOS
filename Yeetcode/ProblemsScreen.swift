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
                NavigationLink(
                    destination: SecondScreen(path: $path, id: problem.id),
                    label: {
                        ProblemRow(
                            name: problem.name,
                            difficulty: problem.difficulty
                        )
                        .padding(3)
                    })
                .buttonStyle(PlainButtonStyle())
                
            }
            
            Spacer()
            
//            NavigationLink(
//                destination: SecondScreen(path: $path),
//                label: {
//                    ContinueButton(color: .mint)
//                })
        }
        .navigationTitle("Problems")
        .navigationBarBackButtonHidden(true)
        .onAppear {
            problemModel.fetch()
        }
    }
}

//#Preview {
//    ProblemsScreen(ProblemModel(), NavigationPath())
//}
