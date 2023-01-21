//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import Foundation
import SwiftUI

class UserManager: ObservableObject {
    @Published var isRegistered: Bool
    var name: String
    
    init() {
        self.isRegistered = !DataManager.shared.username.isEmpty
        self.name = DataManager.shared.username
    }
}
