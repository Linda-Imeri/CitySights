//
//  DirectionsView.swift
//  CitySights
//
//  Created by Linda Imeri on 23.11.22.
//

import SwiftUI

struct DirectionsView: View {
    var business: Business
    
    var body: some View {
        VStack(alignment: .leading){
            //Business Title
            HStack{
                BusinessTitle(business: business)
                
                Spacer()
                
                if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude,let name = business.name {
                    Link("Open in Maps",destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!)
                }
            }.padding()
            //Directions Map
            DirectionsMap()
        }
        .ignoresSafeArea(.all,edges: .bottom)
    }
}

