//
//  MapObjectAnnotation.swift
//  ExamProject
//
//  Created by Veronika Shadlovskaya on 06.08.2021.
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
