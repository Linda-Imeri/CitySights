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
                        
                        BusinessList()
                    }
                    .padding([.horizontal,.top])
                    .navigationBarHidden(true)
                }
                else{
                    //Show map
                    BusinessMap(selectedBusiness: $selectedBusiness)
                        .ignoresSafeArea()
                        .sheet(item: $selectedBusiness) { business in
                            //Create a businessDetailView instance
                            //Pass the selected business
                            BusinessDetail(business: business)
                        }
                }
            }
        }
        else{
            //Still waiting for data
            ProgressView()
        }
    }
}
