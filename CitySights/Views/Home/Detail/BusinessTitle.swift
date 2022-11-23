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
        VStack{
            //Business Name
            Text(business.name!)
                .font(.largeTitle)
                .padding()
            //Loop through DisplayAddress
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!,id: \.self){address in
                    Text(address)
                        .padding(.horizontal)
                }
            }
            //Rating
            Image("regular_\(business.rating ?? 0)")
                .padding()
        }
    }
}
