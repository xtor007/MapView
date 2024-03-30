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
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                area
                points(areaSize: geo.size)
            }
            .background(Color.white)
        }
    }
    
    @ViewBuilder
    var area: some View {
        VStack {
            HStack {
                Spacer()
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    func points(areaSize: CGSize) -> some View {
        ForEach(0..<viewModel.points.count, id: \.self) { pointIndex in
            point(pointIndex, areaSize: areaSize)
        }
    }
    
    @ViewBuilder
    func point(_ index: Int, areaSize: CGSize) -> some View {
        let point = viewModel.points[index]
        Circle()
            .fill(point.state.color)
            .frame(width: viewModel.circleSize, height: viewModel.circleSize)
            .offset(
                x: viewModel.calculateXCoordinate(point.position.latitude, areaWidth: areaSize.width),
                y: viewModel.calculateYCoordinate(point.position.longitude, areaHeight: areaSize.width)
            )
    }
    
    
    
}

#Preview {
    let viewModel = MainViewModel()
    return ZStack {
        Color.gray
        MapView(viewModel: viewModel)
            .aspectRatio(1, contentMode: .fit)
            .onAppear {
                viewModel.startSubscribingData()
            }
    }
    
}
