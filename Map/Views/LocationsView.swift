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
            Map(position: $locationsVM.mapCameraPosition)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(locationsVM.locations) { location in
                        if locationsVM.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3),
                                    radius: 20)
                                .padding()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
                        }
                    }
                }
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
            Button(action: locationsVM.toggleLocationsList) {
                Text(locationsVM.mapLocation.name + ", " + locationsVM.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: locationsVM.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: locationsVM.showLocationsList ? 180 : 0))
                    }
            }
            
            if locationsVM.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
