//
//  MainViewModel.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var points = [MapPoint]()
    
    let circleSize: CGFloat = 20
    
    private let networkHelper = MainViewNetworkHelper()
    
    private let minLatitude: CGFloat = 30.513
    private let maxLatitude: CGFloat = 30.525
    
    private let minLongitude: CGFloat = 50.446
    private let maxLongitude: CGFloat = 50.456
    
    private let delay: TimeInterval = 1
    
    func startSubscribingData() {
        updateDataRequest()
    }
    
    func calculateXCoordinate(_ latitude: Double, areaWidth: CGFloat) -> CGFloat {
        let maxX = areaWidth - circleSize
        return (maxX * (CGFloat(latitude) - minLatitude)) / (maxLatitude - minLatitude)
    }
    
    func calculateYCoordinate(_ longitude: Double, areaHeight: CGFloat) -> CGFloat {
        let maxY = areaHeight - circleSize
        return (maxY * (CGFloat(longitude) - minLongitude)) / (maxLongitude - minLongitude)
    }
    
    private func updateDataRequest() {
        networkHelper.fetchDataIfPossible { [weak self] newData in
            guard let self else { return }
            updateData(newData)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self else { return }
            updateDataRequest()
        }
    }
    
    private func updateData(_ data: [ProcessedAgentData]) {
        let newPoints = data.map { data in
            MapPoint(
                position: Position(latitude: data.latitude, longitude: data.longitude),
                z: data.z,
                state: data.roadState
            )
        }
        newPoints.forEach { point in
            points.removeAll(where: { $0.position == point.position })
            withAnimation {
                points.append(point)
            }
        }
    }
    
}
