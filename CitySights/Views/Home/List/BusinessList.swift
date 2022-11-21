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
                
                BusinessSection(title: "Restaurant", businesses: model.restaurants)
                
                BusinessSection(title: "Sights", businesses: model.sights)
            }
                
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
