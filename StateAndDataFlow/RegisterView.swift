//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import SwiftUI

struct RegisterView: View {

    @State private var name = ""
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                
                Text(name.count.formatted())
                    .padding(.trailing)
                    .foregroundColor(name.count > 2 ? .green: .red)
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(name.count < 3)
        }
    }
    
    private func registerUser() {
        
        if !name.isEmpty {
            userManager.name = name
            userManager.isRegistered.toggle()

            DataManager.shared.username = name
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
