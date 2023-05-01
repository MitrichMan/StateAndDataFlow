//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var userManager: UserManager
    private let storageManager = StorageManager.shared
        
    var body: some View {
        VStack {
            UserNameTF(
                name: $userManager.user.name,
                nameIsValid: userManager.nameIsValid
            )
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
                .disabled(!userManager.nameIsValid)
            }
        }
        .padding()
    }
    
    private func registerUser() {
        userManager.user.isLoggedIn.toggle()
        storageManager.save(user: userManager.user)
    }
}

struct UserNameTF: View {
    @Binding var name: String
    var nameIsValid = false

    var body: some View {
        HStack {
            Spacer()
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Text(name.count.formatted())
                .foregroundColor(nameIsValid ? .green : .red)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserManager())
    }
}
