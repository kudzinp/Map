//
//  LocationsViewModel.swift
//  Map
//
//  Created by Pavel Kudin on 26/02/2025.
//

import Foundation

class LocationsViewModel: ObservableObject {

    @Published var locations: [LocationModel]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
