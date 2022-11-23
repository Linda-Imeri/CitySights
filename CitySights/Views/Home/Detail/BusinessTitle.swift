//
//  BusinessTitle.swift
//  CitySights
//
//  Created by Linda Imeri on 23.11.22.
//

import SwiftUI

struct BusinessTitle: View {
    var business: Business
    
    var body: some View {
        VStack(alignment: .leading){
            //Business Name
            Text(business.name!)
                .font(.title2)
            
            //Loop through DisplayAddress
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!,id: \.self){address in
                    Text(address)
                }
            }
            //Rating
            Image("regular_\(business.rating ?? 0)")
        }
    }
}
