//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("name") var name = ""
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    @State private var disabled = true
    @State private var color: Color = .red
        
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text(name.count.formatted())
                    .foregroundColor(color)
            }
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
                .disabled(disabled)
            }
        }
        .padding()
        
        .onAppear{
            validateCharacterCount(name: name)
        }
        .onChange(of: name) { newValue in
            validateCharacterCount(name: newValue)
        }
    }
    
    private func login() {
        if name.count >= 3 {
            name = name
            isLoggedIn.toggle()
        }
    }
    
    private func validateCharacterCount(name: String) {
        if name.count >= 3 {
            disabled = false
            color = .green
        } else {
            disabled = true
            color = .red
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
