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
        let userLocation = locations.first
        if userLocation != nil {
            //We have a location
            //Stop requesting the location after we get it once
            locationManager.stopUpdatingLocation()
            
            // TODO- If we have the coordinates of the user, send into YelpAPI
            //getBussinesses(category: "arts", location: userLocation!)
            getBussinesses(category: "restaurants", location: userLocation!)
        }
    }
    //MARK: = Yelp API methods
    
    func getBussinesses(category: String, location: CLLocation){
        //Create URL
        
        /*
         let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
         let url = URL(string: URL)
         */
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        var url = urlComponents?.url
        if let url = url {
            
            //MARK: Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            
            //Authenticate API calls with the API Key
            request.addValue("Bearer 5LFSCYgVE8_B6ko-TfEioNmUzTFGun92xDSLSSsMf6VNyq9SYWNbLNIk_jUhoi06XTXxAkTEOUSZIyEGuo6BfgcgqKSY3vzFk3INHx_KZrtu13Ml5Fy5UN0uN3B7Y3Yx", forHTTPHeaderField: "Authorization")
            
            
            //MARK: Get URLSession
            let session = URLSession.shared
            
            //MARK: Create Data Task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                //Check that there isn't an error
                if error == nil{
                    print(response)
                }
            }
            //MARK: Start the Data Task
            dataTask.resume()
        }
        
        
    }
}
