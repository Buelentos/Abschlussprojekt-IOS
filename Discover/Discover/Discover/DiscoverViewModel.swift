//
//  DiscoverViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import Foundation
import SwiftUI


class DiscoverViewModel: ObservableObject{
    @Published var repo = Repository.sharedRepo
    @Published var showFilter = false

}
