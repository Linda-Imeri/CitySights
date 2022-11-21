//
//  ContentModel.swift
//  CitySights
//
//  Created by Linda Imeri on 21.11.22.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    var locationManager = CLLocationManager()
    override init(){
        //Call init method of NSObject
        super.init()
        
        //Set content model as the delegate of the location manager
        locationManager.delegate = self
        
        // Request permission from user
        locationManager.requestWhenInUseAuthorization()
        
        //TODO: Start geolocating the user after we get permission
        //locationManager.startUpdatingLocation()
    }
    //MARK - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse{
            //We have permission
            //Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            //We don't have permission
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Gives us the location of the user
        print(locations.first ?? "No location found")
        
        //Stop requesting the location after we get it once
        locationManager.stopUpdatingLocation()
        
        // TODO- If we have the coordinates of the user, send into YelpAPI
    }
    
}
