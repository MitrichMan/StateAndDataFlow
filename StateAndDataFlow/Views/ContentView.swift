//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    private let storageManager = StorageManager.shared
    
    @AppStorage("name") var name = ""
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 50)
            Spacer()
            Text(timer.counter.formatted())
                .font(.largeTitle)
            Spacer()
            
            ButtonView(title: timer.buttonTitle, color: .red) {
                timer.startTimer()
            }
            
            Spacer()
            
            ButtonView(title: "Log Out", color: .blue) {
                storageManager.clear(userManager: userManager)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
