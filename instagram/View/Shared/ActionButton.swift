//
//  ActionButton.swift
//  instagram
//
//  Created by James Saeed on 09/01/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    
    let title: String
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 40)
                    .foregroundColor(Color("primary"))
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
            }
        }
    }
}

struct SecondaryActionButton: View {
    
    let title: String
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(Color("primary"))
                .font(.system(size: 17, weight: .semibold, design: .rounded))
        }
    }
}
