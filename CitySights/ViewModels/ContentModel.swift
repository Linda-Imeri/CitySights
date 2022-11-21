//
//  ContentModel.swift
//  CitySights
//
//  Created by Linda Imeri on 21.11.22.
//

import Foundation
import CoreLocation

class ContentModel: ObservableObject {
    var locationManager = CLLocationManager()
    init(){
        // Request permission from user
        locationManager.requestWhenInUseAuthorization()
        
        //TODO: Start geolocating the user after we get permission
        //locationManager.startUpdatingLocation()
    }
    
    
    
}
