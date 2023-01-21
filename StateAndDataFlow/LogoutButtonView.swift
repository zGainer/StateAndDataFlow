//
//  LogoutButtonView.swift
//  StateAndDataFlow
//
//  Created by Eugene on 17.01.23.
//

import SwiftUI

struct LogoutButtonView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Button(action: logoutUser) {
            Text("Logout")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

extension LogoutButtonView {
    
    private func logoutUser() {
        DataManager.shared.username = ""
        
        userManager.name = ""
        userManager.isRegistered.toggle()
    }
}

struct LogoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButtonView()
    }
}
