//
//  PlaceModel.swift
//  SWE_Project
//
//  Created by Khalid R on 18/03/1446 AH.
//
import Foundation
import MapKit
import CoreLocation

class PlaceModel: Codable, Identifiable {
    var id = UUID()
    var name: String?
    var price: Double?
    var description: String?
    var rate: Double?
    var visitTime: String?
    var images: [String]?
    var type: PlaceType?
    var city: City?
    var location: CLLocationCoordinate2D = .init(latitude: 0.0, longitude: 0.0)
}

enum City: String, Codable, CaseIterable {
    case riyadh
    case jeddah
    
    var title: String {
        switch self {
        case .riyadh:
            return "Riyadh"
        case .jeddah:
            return "Jeddah"
        }
            
        
    }
}


    enum PlaceType: String, Codable {
        case restaurant
        case hotel
        case museum
        case entertainment
        
        
        var title: String {
            switch self {
            case .restaurant:
                return "Restaurant"
            case .hotel:
                return "Hotel"
            case .museum:
                return "Museum"
            case .entertainment:
                return "Entertainment"
            }
        }
        
        
        var imageName: String {
            return self.rawValue
        }
    }



extension CLLocationCoordinate2D: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(longitude)
        try container.encode(latitude)
    }
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let longitude = try container.decode(CLLocationDegrees.self)
        let latitude = try container.decode(CLLocationDegrees.self)
        self.init(latitude: latitude, longitude: longitude)
    }
}

extension CLLocationCoordinate2D: Equatable {}
public func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}
