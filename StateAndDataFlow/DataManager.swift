//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Eugene on 20.01.23.
//

import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("username") var username = ""
    
    private init() {}
}
