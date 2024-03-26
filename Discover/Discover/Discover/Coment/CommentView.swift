//
//  ComentView.swift
//  Discover
//
//  Created by Bülent Yavuz on 15.03.24.
//

import SwiftUI

struct CommentView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    @EnvironmentObject private var discoverViewModel: DiscoverViewModel
    
    var body: some View {
        List{
            VStack{
                //ForEach(comentar){coment in
                Text("Name des Users:")
                Text("coment des Users")
                //}
            }
        }
    }
}

#Preview {
    CommentView()
        .environmentObject(MainViewModel())
        .environmentObject(DiscoverViewModel())
}
