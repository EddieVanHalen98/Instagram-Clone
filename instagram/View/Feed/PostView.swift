//
//  PostView.swift
//  instagram
//
//  Created by James Saeed on 03/01/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    var body: some View {
        VStack(spacing: 24) {
            PostImage()
            PostBodyView()
        }.padding(.top, 16)
        .padding(.bottom, 8)
    }
}

private struct PostImage: View {
    
    var body: some View {
        GeometryReader { geometry in
            Image("test_image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
                .cornerRadius(24)
                .shadow(color: Color(white: 0.8), radius: 8, x: 0, y: 2)
                .rotation3DEffect(self.getRotationAngle(from: geometry), axis: (x: 10, y: 0, z: 0))
        }.frame(width: 327, height: 327)
    }
    
    func getRotationAngle(from geometry: GeometryProxy) -> Angle {
        let degrees = (geometry.frame(in: .global).minY - 384) / 32
        
        if degrees <= 0 {
            return Angle(degrees: 0)
        }
        
        return Angle(degrees: Double(degrees))
    }
}

private struct PostBodyView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            PostActionBar()
            
            Text("test caption")
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .opacity(0.85)
        }.padding(.horizontal, 32)
    }
}

private struct PostActionBar: View {
    
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Image("test_avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32, height: 32)
                    .clipped()
                    .cornerRadius(16)
                Text("jenny123")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .opacity(0.85)
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                Image("like")
                    .foregroundColor(Color("button"))
                Image("comment")
                    .foregroundColor(Color("button"))
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
