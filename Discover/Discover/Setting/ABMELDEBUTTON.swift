//
//  ABMELDEBUTTON.swift
//  Discover
//
//  Created by Bülent Yavuz on 29.02.24.
//

import SwiftUI

struct ABMELDEBUTTON: View {
    @EnvironmentObject private var viewModel: AuthentificationViewModel

    var body: some View {
        Button("ABMELDEN"){
            viewModel.logout()
        }
    }
}

#Preview {
    ABMELDEBUTTON()
}
