//
//  LaunchView.swift
//  CitySights
//
//  Created by Linda Imeri on 21.11.22.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        //Detect the authorization status of geolocating the user
        if model.authorizationState == .notDetermined{
            //Show onboarding
            OnboardingView()
        }
        else if model.authorizationState == CLAuthorizationStatus.authorizedAlways || model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse {
            //If approved, show home view
            HomeView()
        }
        else{
        //If denied show denied view
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
