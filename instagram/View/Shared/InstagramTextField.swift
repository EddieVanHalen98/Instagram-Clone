//
//  InstagramTextField.swift
//  instagram
//
//  Created by James Saeed on 09/01/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct InstagramTextField: View {
    
    let placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 44)
                .foregroundColor(Color("primaryLight"))
            TextField(placeholder, text: $text)
                .autocapitalization(.none)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundColor(Color("primaryDark"))
                .padding(.horizontal, 24)
        }
    }
}

struct InstagramPasswordField: View {
    
    @Binding var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 44)
                .foregroundColor(Color("primaryLight"))
            SecureField("password", text: $text)
                .autocapitalization(.none)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundColor(Color("primaryDark"))
                .padding(.horizontal, 24)
        }
    }
}
