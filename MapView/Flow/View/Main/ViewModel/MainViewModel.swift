//
//  MainViewModel.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var points = [MapPoint]()
    
    let circleSize: CGFloat = 20
    
    private let minLatitude: CGFloat = 50.446
    private let maxLatitude: CGFloat = 50.456
    
    private let minLongitude: CGFloat = 30.513
    private let maxLongitude: CGFloat = 30.525
    
    func startSubscribingData() {
        points.append(MapPoint(position: Position(latitude: 50.450386085935094, longitude: 30.514547100067142), z: 0, state: .bad, updatedDate: .now))
        points.append(MapPoint(position: Position(latitude: 50.451486085935094, longitude: 30.521547100067142), z: 0, state: .norm, updatedDate: .now))
        points.append(MapPoint(position: Position(latitude: 50.453586085935094, longitude: 30.513547100067142), z: 0, state: .good, updatedDate: .now))
        points.append(MapPoint(position: Position(latitude: 50.447086085935094, longitude: 30.517547100067142), z: 0, state: .veryBad, updatedDate: .now))
        points.append(MapPoint(position: Position(latitude: 50.448186085935094, longitude: 30.524547100067142), z: 0, state: .perfect, updatedDate: .now))
    }
    
    func calculateXCoordinate(_ latitude: Double, areaWidth: CGFloat) -> CGFloat {
        let maxX = areaWidth - circleSize
        return (maxX * (CGFloat(latitude) - minLatitude)) / (maxLatitude - minLatitude)
    }
    
    func calculateYCoordinate(_ longitude: Double, areaHeight: CGFloat) -> CGFloat {
        let maxY = areaHeight - circleSize
        return (maxY * (CGFloat(longitude) - minLongitude)) / (maxLongitude - minLongitude)
    }
    
}
