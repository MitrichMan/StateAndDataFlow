//
//  UserSettings.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import Foundation

final class UserSettings: ObservableObject {
    @Published var isLoggedIn = false
    var name = ""
    
    func logOut() {
        isLoggedIn = false
        name = ""
    }
}
