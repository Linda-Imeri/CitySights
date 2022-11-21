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
    
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
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
            getBussinesses(category: Constants.sightsKey, location: userLocation!)
            getBussinesses(category: Constants.restaurantsKey, location: userLocation!)
        }
    }
    //MARK: = Yelp API methods
    
    func getBussinesses(category: String, location: CLLocation){
        //Create URL
        
        /*
         let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
         let url = URL(string: URL)
         */
        var urlComponents = URLComponents(string: Constants.apiUrl)
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
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            
            //MARK: Get URLSession
            let session = URLSession.shared
            
            //MARK: Create Data Task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                //Check that there isn't an error
                if error == nil{
                    do{
                        //Parse json
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        DispatchQueue.main.async {
                            //Assign results to the appropriate property
                            switch category{
                                case Constants.sightsKey:
                                    self.sights = result.businesses
                                case Constants.restaurantsKey:
                                    self.restaurants = result.businesses
                                default: break
                            }
                        }
                    }
                    catch{
                        print(error)
                    }
                }
            }
            //MARK: Start the Data Task
            dataTask.resume()
        }
        
        
    }
}
