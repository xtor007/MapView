//
//  MapView.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import SwiftUI

struct MapView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
}

#Preview {
    MapView(viewModel: MainViewModel())
}
