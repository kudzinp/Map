//
//  LocationsViewModel.swift
//  Map
//
//  Created by Pavel Kudin on 26/02/2025.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {

    @Published var locations: [LocationModel]
    
    @Published var mapLocation: LocationModel {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!

        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: LocationModel) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
}
