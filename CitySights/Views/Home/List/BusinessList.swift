//
//  BusinessList.swift
//  CitySights
//
//  Created by Linda Imeri on 21.11.22.
//

import SwiftUI

struct BusinessList: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]){
                Section(header: BusinessSectionHeader(title: "Restaurants")){
                    ForEach(model.restaurants){ business in
                        Text(business.name ?? "")
                        Divider()
                    }
                }
                    
                Section(header: BusinessSectionHeader(title: "Sights")){
                    ForEach(model.sights){ business in
                        Text(business.name ?? "")
                        Divider()
                    }
                }
            }
                
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
