//
//  DirectionsMap.swift
//  CitySights
//
//  Created by Linda Imeri on 23.11.22.
//

import MapKit
import SwiftUI

struct DirectionsMap: UIViewRepresentable{
    
    func makeUIView(context: Context) -> MKMapView{
        let map = MKMapView()
        return map
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
    }
    //MARK - Coordinator
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    class Coordinator: NSObject, MKMapViewDelegate{
        
    }
}
