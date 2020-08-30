//
//  MCUPresidents.swift
//  assignment4
//
//  Created by Andy Olivares on 4/12/20.
//  Copyright © 2020 Andy Olivares. All rights reserved.
//

import Foundation

class MCUPresidents: Decodable{
    var name = ""
    var number = 0
    var startDate = ""
    var endDate = ""
    var nickName = ""
    var politicalParty = ""
    var URLimage = ""
    
    
    private enum CodingKeys: String, CodingKey{
        case name = "Name"
        case number = "Number"
        case startDate = "Start Date"
        case endDate = "End Date"
        case nickName = "Nickname"
        case politicalParty = "Political Party"
        case URLimage = "URL"
    }
    
    init(name: String, number: Int, startDate: String, endDate: String, nickName: String, politicalParty: String, URLimage: String){
        self.name = name
        self.number = number
        self.startDate = startDate
        self.endDate = endDate
        self.nickName = nickName
        self.politicalParty = politicalParty
        self.URLimage = URLimage
    }
}
