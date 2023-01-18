//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var letterCounter = 0
    
    @State private var name = ""
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { _ in
                        letterCounter = name.count
                    }
                
                Text(letterCounter.formatted())
                    .padding(.trailing)
                    .foregroundColor(letterCounter > 2 ? .green: .red)
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(letterCounter < 3)
        }
    }
    
    private func registerUser() {
        @AppStorage("username") var username = ""
        
        if !name.isEmpty {
            userManager.name = name
            userManager.isRegistered.toggle()

            username = name
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
