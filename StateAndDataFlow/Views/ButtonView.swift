//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Dmitrii Melnikov on 29.04.2023.
//

import SwiftUI


struct ButtonView: View {
    let title: String
    let action: () -> Void
    let color: Color
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
