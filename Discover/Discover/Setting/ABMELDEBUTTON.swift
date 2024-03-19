//
//  ABMELDEBUTTON.swift
//  Discover
//
//  Created by Bülent Yavuz on 29.02.24.
//

import SwiftUI

struct ABMELDEBUTTON: View {
    @EnvironmentObject private var viewModel: MainViewModel

    var body: some View {
        Button("ABMELDEN"){
            viewModel.logout()
            viewModel.removeListener()
        }
    }
}

#Preview {
    ABMELDEBUTTON()
}
