//
//  LocationsView.swift
//  Map
//
//  Created by Pavel Kudin on 26/02/2025.
//

import SwiftUI
import MapKit

struct LocationsView: View {

    @EnvironmentObject private var locationsVM: LocationsViewModel

    var body: some View {
        ZStack {
            Map(initialPosition: .region(locationsVM.mapRegion))
                .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
