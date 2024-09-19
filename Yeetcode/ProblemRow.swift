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
                .frame(width: 175, height: 65, alignment: .leading)
                .padding()
            
            Spacer()
            
            Text(difficulty.capitalized)
                .padding()
        }
        .frame(width: 330, height: 60)
        .padding().background(
                Rectangle()
                    .fill(Color(UIColor.systemBackground))
                    .cornerRadius(12)
                    .shadow(
                        color: Color.gray.opacity(0.4),
                        radius: 8,
                        x: 0,
                        y: 0
                    )
            )
    }
}

#Preview {
    Login()
}
