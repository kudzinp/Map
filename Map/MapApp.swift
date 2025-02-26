//
//  MapApp.swift
//  Map
//
//  Created by Pavel Kudin on 24/02/2025.
//

import SwiftUI

@main
struct MapApp: App {

    @StateObject private var locationsVM = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(locationsVM)
        }
    }
}
