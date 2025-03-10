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
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack {
            Text(locationsVM.mapLocation.name + ", " + locationsVM.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
