//
//  HomeView.swift
//  CitySights
//
//  Created by Linda Imeri on 21.11.22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    @State var selectedBusiness: Business?
    
    var body: some View {
        
        if model.restaurants.count != 0  {
            //Determine if we should show list of map
            NavigationView {
                if !isMapShowing{
                    //Show list
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Button("Switch to map view"){
                                self.isMapShowing = true
                            }
                        }
                        Divider()
                        
                        ZStack(alignment: .top){
                            BusinessList()
                            
                            HStack{
                                Spacer()
                                YelpAttribution(link: "https://yelp.ca")
                            }
                            .padding(.trailing,-20)
                        }
                    }
                    .padding([.horizontal,.top])
                    .navigationBarHidden(true)
                }
                else{
                    ZStack(alignment:.top){
                        //Show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                //Create a businessDetailView instance
                                //Pass the selected business
                                BusinessDetail(business: business)
                            }
                        //Rectangle overlay
                        ZStack{
                            Rectangle().foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            
                            HStack{
                                Image(systemName: "location")
                                Text("San Francisco")
                                Spacer()
                                Button("Switch to list view"){
                                    self.isMapShowing = false
                                }
                            }
                            .padding()
                        }.padding()
                    }
                    .navigationBarHidden(true)
                }
            }
        }
        else{
            //Still waiting for data
            ProgressView()
        }
    }
}
