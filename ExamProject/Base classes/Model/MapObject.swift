//
//  MapObject.swift
//  ExamProject
//
//  Created by Veronika Shadlovskaya on 04.08.2021.
//

import Foundation
import MapKit

class MapObject: NSObject, MKAnnotation {
    let id, title, address: String?
    let coordinate: CLLocationCoordinate2D
    
    init(
        id: String?,
        name: String?,
        location: Location
    ) {
        self.id = id
        self.title = name
        self.address = location.address
        let lat = location.lat ?? 0
        let lng = location.lng ?? 0
        self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)

        super.init()
    }

    var subtitle: String? {
        return address
    }
}

struct MetaAndMapObjectResponse: Codable {
    let meta: Meta?
    let response: MapObjectResponse?
}

// MARK: - Meta
struct Meta: Codable {
    let code: Int?
    let requestID: String?

    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}
struct MapObjectResponse: Codable {
    let warning: Warning?
    let suggestedRadius: Int?
    let headerLocation, headerFullLocation, headerLocationGranularity: String?
    let totalResults: Int?
    let suggestedBounds: SuggestedBounds?
    let groups: [Group]?
}

// MARK: - Group
struct Group: Codable {
    let type, name: String?
    let items: [GroupItem]?
}

// MARK: - GroupItem
struct GroupItem: Codable {
    let reasons: Reasons?
    let venue: Venue?
}

// MARK: - Reasons
struct Reasons: Codable {
    let count: Int?
    let items: [ReasonsItem]?
}

// MARK: - ReasonsItem
struct ReasonsItem: Codable {
    let summary, type, reasonName: String?
}

// MARK: - Venue
struct Venue: Codable {
    let id, name: String?
    let location: Location?
    let categories: [Category]?
    let popularityByGeo: Double?
    let venuePage: VenuePage?
}

// MARK: - Category
struct Category: Codable {
    let id, name, pluralName, shortName: String?
    let icon: Icon?
    let primary: Bool?
}

// MARK: - Icon
struct Icon: Codable {
    let iconPrefix: String?
    let suffix: String?

    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case suffix
    }
}

// MARK: - Location
struct Location: Codable {
    let address, crossStreet: String?
    let lat, lng: Double?
    let labeledLatLngs: [LabeledLatLng]?
    let distance: Int?
    let postalCode, cc, city, state: String?
    let country: String?
    let formattedAddress: [String]?
}

// MARK: - LabeledLatLng
struct LabeledLatLng: Codable {
    let label: String?
    let lat, lng: Double?
}

// MARK: - VenuePage
struct VenuePage: Codable {
    let id: String?
}

// MARK: - SuggestedBounds
struct SuggestedBounds: Codable {
    let ne, sw: Ne?
}

// MARK: - Ne
struct Ne: Codable {
    let lat, lng: Double?
}

// MARK: - Warning
struct Warning: Codable {
    let text: String?
}
