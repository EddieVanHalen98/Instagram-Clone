//
//  FeedView.swift
//  instagram
//
//  Created by James Saeed on 03/01/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    
    var body: some View {
        VStack {
            Header()
            
            ScrollView(showsIndicators: false) {
                PostView()
                PostView()
                PostView()
            }
        }
    }
}

private struct Header: View {
    
    var body: some View {
        HStack(alignment: .top) {
            Image("camera")
                .foregroundColor(Color("accent"))
            Spacer()
            Image("logo")
            Spacer()
            Image("inbox")
                .foregroundColor(Color("accent"))
        }.padding(.horizontal, 32)
        .padding(.top, 24)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
