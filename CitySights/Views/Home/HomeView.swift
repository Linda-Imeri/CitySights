//
//  HomeView.swift
//  CitySights
//
//  Created by Linda Imeri on 21.11.22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    @State var isMApShowing = false
    var body: some View {
        if model.restaurants.count != 0 || model.sights.count != 0 {
            //Determine if we should show list of map
            if !isMApShowing{
                //Show list
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "location")
                        Text("San Francisco")
                        Spacer()
                        Text("Switch to map view")
                    }
                    Divider()
                    BusinessList()
                }
            }
            else{
                //Show map
            }
        }
        else{
            //Still waiting for data
            ProgressView()
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
