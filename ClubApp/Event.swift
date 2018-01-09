//
//  Event.swift
//  ClubApp
//
//  Created by intellye labs on 26/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation
class Event
{
    
    var date : String
    var details :[EventsDetails]
    init(dates :String,detailss: [EventsDetails]) {
       self.date=dates
        self.details=detailss
    }
    
    
}
