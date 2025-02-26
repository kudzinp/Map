//
//  LocationsView.swift
//  Map
//
//  Created by Pavel Kudin on 26/02/2025.
//

import SwiftUI

struct LocationsView: View {

    @EnvironmentObject private var locationsVM: LocationsViewModel

    var body: some View {
        List {
            ForEach(locationsVM.locations) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
