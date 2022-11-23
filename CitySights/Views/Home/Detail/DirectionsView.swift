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
                Link("Open in Maps",destination: URL(string: "")!)
            }
            //Directions Map
        }
    }
}

