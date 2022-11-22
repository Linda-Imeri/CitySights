//
//  BusinessMap.swift
//  CitySights
//
//  Created by Linda Imeri on 22.11.22.
//

import Foundation
import MapKit
import SwiftUI

struct BusinessMap: UIViewRepresentable {
    @EnvironmentObject var model : ContentModel
    
    var locations: [MKPointAnnotation]{
        var annotations = [MKPointAnnotation]()
        
        //Create a set of annotations from our list of businesses
        //Combine and loops through all
        for business in model.restaurants + model.sights{
            // if the business has a lat/long, create an MKPointAnnotation
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude{
                
                //Create a new annotation
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotations.append(a)
            }
        }
        return annotations
    }
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        //Make the user show up on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //Remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        
        //Add the ones based on the business
        uiView.showAnnotations(self.locations, animated: true)
    }
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
}