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
            VStack(alignment: .leading,spacing: 0){
                
                GeometryReader(){geo in
                    //Business image
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all,edges: .top)
                //Open/Closed indicator
                ZStack(alignment: .leading){
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray: .blue)
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                }
            }
            Group{
                BusinessTitle(business: business)
                Divider()
                
                //Phone
                HStack{
                    Text("Phone:")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding()
                Divider()
                
                //Reviews
                //Phone
                HStack{
                    Text("Reviews:")
                        .bold()
                    Text(String(business.reviewCount ?? 0 ))
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                
                Divider()
                HStack{
                    Text("Websites:")
                        .bold()
                    Text(business.url ?? "" )
                        .lineLimit(1)
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                Divider()
            }
            //Get directions button
            Button(action: {}, label: {
                ZStack{
                    Rectangle()
                        .frame(height: 58)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                }
            })
            .padding()
            
        }
    }
}

struct BusinessDetail_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetail(business: Business.getTestData())
    }
}
