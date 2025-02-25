//
//  LocationModel.swift
//  Map
//
//  Created by Pavel Kudin on 25/02/2025.
//

import Foundation
import MapKit

struct LocationModel {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}
