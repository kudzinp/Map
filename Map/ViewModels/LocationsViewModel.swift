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
            updateMapCameraPosition(location: mapLocation)
        }
    }
    
    @Published var mapCameraPosition: MapCameraPosition
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.mapCameraPosition = .region(
            MKCoordinateRegion(
                center: locations.first!.coordinates,
                span: mapSpan))
    }
    
    private func updateMapCameraPosition(location: LocationModel) {
        withAnimation(.easeInOut) {
            mapCameraPosition = .region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: mapSpan))
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: LocationModel) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
}
