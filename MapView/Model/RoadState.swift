//
//  RoadState.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import Foundation

enum RoadState: Codable {
    
    case veryBad, bad, norm, good, perfect, unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)
        
        switch stringValue {
        case "very bad": self = .veryBad
        case "bad": self = .bad
        case "norm": self = .norm
        case "good": self = .good
        case "perfect": self = .perfect
        default: self = .unknown
        }
    }
    
    var name: String {
        switch self {
        case .veryBad:
            "Very Bad"
        case .bad:
            "Bad"
        case .norm:
            "Norm"
        case .good:
            "Good"
        case .perfect:
            "Perfect"
        case .unknown:
            "Unknown"
        }
    }
    
}
