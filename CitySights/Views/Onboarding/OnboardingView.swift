//
//  OnboardingView.swift
//  CitySights
//
//  Created by Linda Imeri on 21.11.22.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    var body: some View {
        VStack{
            //Tab View
            TabView(selection: $tabSelection) {
                //First tab
                VStack{
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to City Sights")
                        .bold()
                        .font(.title)
                    Text("City Sights helps you find the best of the city!")
                }
                .tag(0)
                
                //Second tab
                VStack{
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city? ")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venues and more,based on your location!")
                }
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            //Button
            Button {
                //Detect which tab it is
                if tabSelection == 0 {
                    tabSelection = 1
                }
                //Request for geolocation permission
                else{
                    model.requestGeoLocationPermission()
                }
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text(tabSelection == 0 ? "Next" : "Get my Location")
                        .bold()
                        .padding()
                }
            }

        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
