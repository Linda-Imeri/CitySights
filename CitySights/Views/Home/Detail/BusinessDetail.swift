//
//  BusinessDetail.swift
//  CitySights
//
//  Created by Linda Imeri on 22.11.22.
//

import SwiftUI

struct BusinessDetail: View {
    var business: Business
    
    var body: some View {
        VStack(alignment: .leading){
            GeometryReader(){geo in
                //Business image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
            }
            //Open/Closed indicator
            ZStack(alignment: .leading){
                Rectangle()
                    .frame(height: 36)
                    .foregroundColor(business.isClosed! ? .gray: .blue)
                Text(business.isClosed! ? "Open" : "Closed")
            }
            
            Group{
                //Business Name
                Text(business.name!)
                    .font(.largeTitle)
                //Loop through DisplayAddress
                if business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!,id: \.self){address in
                        Text(address)
                    }
                }
                //Rating
                Image("regular_ \(business.rating ?? 0)")
                Divider()
                
                //Phone
                
                Divider()
                
                //Reviews
                
                Divider()

                
            }
            //
            
        }
    }
}

struct BusinessDetail_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetail(business: Business.getTestData())
    }
}
