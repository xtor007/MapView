//
//  MainViewModel.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var points = [MapPoint]()
    
    func startSubscribingData() {
        points.append(MapPoint(position: Position(latitude: 50.450386085935094, longitude: 30.524547100067142), z: 0, state: .bad, updatedDate: .now))
        points.append(MapPoint(position: Position(latitude: 50.450486085935094, longitude: 30.521547100067142), z: 0, state: .norm, updatedDate: .now))
        points.append(MapPoint(position: Position(latitude: 50.450586085935094, longitude: 30.525547100067142), z: 0, state: .good, updatedDate: .now))
        points.append(MapPoint(position: Position(latitude: 50.450086085935094, longitude: 30.527547100067142), z: 0, state: .veryBad, updatedDate: .now))
        points.append(MapPoint(position: Position(latitude: 50.450186085935094, longitude: 30.529547100067142), z: 0, state: .perfect, updatedDate: .now))
    }
    
}
