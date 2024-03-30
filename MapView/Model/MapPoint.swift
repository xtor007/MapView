//
//  MaoPoint.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import Foundation

struct MapPoint {
    let position: Position
    let z: Int
    let state: RoadState
}

struct Position: Equatable {
    let latitude: Double
    let longitude: Double
}
