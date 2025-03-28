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
    let maxWidthForIpad: CGFloat = 700

    var body: some View {
        ZStack {
            mapLayer
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                Spacer()
                locationsPreviewStack
            }
        }
        .sheet(item: $locationsVM.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    
    private var mapLayer: some View {
        Map(position: $locationsVM.mapCameraPosition) {
            ForEach(locationsVM.locations) { location in
                Annotation("", coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(locationsVM.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            locationsVM.showNextLocation(location: location)
                        }
                }
            }
        }
    }
    
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
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(locationsVM.locations) { location in
                if locationsVM.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3),
                            radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}
