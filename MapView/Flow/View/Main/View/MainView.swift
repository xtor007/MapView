//
//  MainView.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            Spacer()
            MapView(viewModel: viewModel)
                .aspectRatio(1, contentMode: .fill)
            Spacer()
            lastDataLine
            Spacer()
        }
        .padding(16)
        .background(Color.gray)
        .onAppear {
            viewModel.startSubscribingData()
        }
    }
    
    @ViewBuilder
    var lastDataLine: some View {
        if let lastPoint = viewModel.points.last {
            Text("\(lastPoint.position.latitude) \(lastPoint.position.longitude) - \(lastPoint.state.name)")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.blue)
                .padding(8)
                .background(Capsule().fill(.white))
        } else {
            Text("No Data")
        }
    }
    
}

#Preview {
    MainView(viewModel: MainViewModel())
}
