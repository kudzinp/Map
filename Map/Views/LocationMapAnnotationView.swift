//
//  LocationMapAnnotationView.swift
//  Map
//
//  Created by Pavel Kudin on 20/03/2025.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(.degrees(180))
                .offset(y: -2)
                .padding(.bottom, 36)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        LocationMapAnnotationView()
    }
}
