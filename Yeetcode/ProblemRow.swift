//
//  ProblemRow.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/18/24.
//
import SwiftUI

struct ProblemRow: View {
    let name: String
    let difficulty: String
    
    var body: some View {
        HStack {
            Text(name)
                .bold()
                .frame(width: 200, alignment: .leading)
                .padding()
            
            Spacer()
            
            Text(difficulty)
                .padding()
        }
        .frame(width: 350, height: 60)
        .padding().background(
                Rectangle()
                    .fill(Color(UIColor.systemBackground))
                    .cornerRadius(12)
                    .shadow(
                        color: Color.gray.opacity(0.5),
                        radius: 8,
                        x: 0,
                        y: 0
                    )
            )
    }
}

#Preview {
    ContentView()
}
