//
//  ContinueButton.swift
//  Yeetcode
//
//  Created by Hunter Motte on 9/19/24.
//
import SwiftUI

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
