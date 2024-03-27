//
//  SearchMainView.swift
//  Discover
//
//  Created by Bülent Yavuz on 12.03.24.
//

import SwiftUI

struct SearchMainView: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    var body: some View {
        
        NavigationStack {
            ForEach(searchViewModel.searchItemList){ searchItem in
                //Die Ui für ein SearchElement
                NavigationLink(value: searchItem) {
                    SearchElement( einSearchElement: searchItem)
                }
            }
        }
    }
}

#Preview {
    SearchMainView()
        .environmentObject(SearchViewModel())
}
