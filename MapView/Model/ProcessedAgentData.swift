//
//  ProcessedAgentData.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import Foundation

struct ProcessedAgentData: Codable {
    
    let id: Int
    let roadState: RoadState
    let userId: Int
    let x: Int
    let y: Int
    let z: Int
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case roadState = "road_state"
        case userId = "user_id"
        case x = "x"
        case y = "y"
        case z = "z"
        case latitude = "latitude"
        case longitude = "longitude"
    }
    
}
