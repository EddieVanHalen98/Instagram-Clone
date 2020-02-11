//
//  LoginView.swift
//  instagram
//
//  Created by James Saeed on 09/01/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isLoggedIn: Bool
    
    @State var isLoading = false
    @State var isRegistering = false
    
    @State var email = ""
    @State var password = ""
    @State var username = ""
    
    @State var showErrorDialog = false
    @State var errorMessage = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Image("logo_large").padding(48)
            Spacer()
            LoginFields(isRegistering: $isRegistering,
                        email: $email,
                        password: $password,
                        username: $username)
            Spacer()
            LoginActionButtons(isLoading: $isLoading,
                               isRegistering: $isRegistering,
                               primaryAction: primaryAction,
                               secondaryAction: secondaryAction)
        }.alert(isPresented: $showErrorDialog) {
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func primaryAction() {
        if isRegistering {
            register()
        } else {
            login()
        }
    }
    
    func secondaryAction() {
        UIImpactFeedbackGenerator().impactOccurred(intensity: 0.5)
        withAnimation { self.isRegistering = true }
    }
    
    func register() {
        withAnimation { self.isLoading = true }
        
        APIGateway.shared.register(with: email, password, username) { response in
            withAnimation { self.isLoading = false }
            
            guard response == .success else {
                self.failure(with: response)
                return
            }
            
            self.success(username: self.username, avatarPath: "")
        }
    }
    
    func login() {
        withAnimation { self.isLoading = true }
        
        APIGateway.shared.login(with: email, password) { user, response in
            withAnimation { self.isLoading = false }
            
            guard response == .success else {
                self.failure(with: response)
                return
            }
            
            self.success(username: user!.username, avatarPath: user!.avatarPath)
        }
    }
    
    func failure(with response: APIResponse) {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
        
        errorMessage = response.rawValue
        showErrorDialog = true
    }
    
    func success(username: String, avatarPath: String) {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(avatarPath, forKey: "avatarPath")
        
        isLoggedIn = true
    }
}

private struct LoginFields: View {
    
    @Binding var isRegistering: Bool
    
    @Binding var email: String
    @Binding var password: String
    @Binding var username: String
    
    var body: some View {
        VStack(spacing: 16) {
            InstagramTextField(placeholder: "email address", text: $email)
            InstagramPasswordField(text: $password)
            
            if isRegistering {
                InstagramTextField(placeholder: "username", text: $username)
            }
        }.padding(.horizontal, 32)
    }
}

private struct LoginActionButtons: View {
    
    @Binding var isLoading: Bool
    @Binding var isRegistering: Bool
    
    let primaryAction: () -> Void
    let secondaryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            if isLoading {
                ActivityIndicator(isAnimating: $isLoading)
            } else {
                ActionButton(title: isRegistering ? "Done" : "Log In", action: primaryAction)
                if !isRegistering {
                    SecondaryActionButton(title: "Register", action: secondaryAction)
                }
            }
        }.padding(.horizontal, 64)
        .padding(.bottom, 24)
    }
}
