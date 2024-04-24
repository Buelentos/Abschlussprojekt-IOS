//
//  ComentView.swift
//  Discover
//
//  Created by Bülent Yavuz on 15.03.24.
//

import SwiftUI

struct CommentView: View {
    @EnvironmentObject private var discoverViewModel: DiscoverViewModel
    var body: some View {
        
        List{
            VStack{
                Text("Name des Users:")
                Text("coment des Users")
            }
        }
    }
}

#Preview {
    CommentView()
        .environmentObject(DiscoverViewModel())
}
