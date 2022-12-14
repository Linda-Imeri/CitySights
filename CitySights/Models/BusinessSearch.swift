//
//  BusinessSearch.swift
//  CitySights
//
//  Created by Linda Imeri on 21.11.22.
//

import Foundation
struct BusinessSearch: Decodable{
    var businesses = [Business]()
    var total = 0
    var region = Region()
}
struct Region: Decodable{
    var center = Coordinate()
}
