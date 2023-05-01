//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    
    @AppStorage("name") var name = ""
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    var body: some View {
        VStack {
            Text("Hi, \(name)")
                .font(.largeTitle)
                .padding(.top, 50)
            Spacer()
            Text(timer.counter.formatted())
                .font(.largeTitle)
            Spacer()
            
            ButtonView(
                title: timer.buttonTitle,
                action: timer.startTimer,
                color: .red
            )
            
            Spacer()
            
            ButtonView(
                title: "Log Out",
                action: logOut,
                color: .blue
            )
        }
        .padding()
    }
    
    func logOut() {
        isLoggedIn = false
        name = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
