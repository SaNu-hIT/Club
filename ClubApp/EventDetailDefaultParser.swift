//
//  EventDetailDefaultParser.swift
//  ClubApp
//
//  Created by intellye labs on 27/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation

import UIKit
import Alamofire




@objc protocol EventDefaultRespo : class
{
    @objc optional func eventDefaultResponceLister(response :NSDictionary)
}
class EventDetailDefaultParser:NSObject
{

    
    weak var delegate: EventDefaultRespo?
    func eventCheck(Event_TypeId :String,Event_DateFrom :String,Event_DateTo :String,sortFlag :String) {
        
        
        
        let parameters: Parameters = [
            "Event_TypeId": Event_TypeId,
            "Event_DateFrom":Event_DateFrom,
            "Event_DateTo": Event_DateTo,
            "sortFlag":sortFlag
        ]
        let str_URL=Constants.BASEURL+"list_events_default"
        
        
        Alamofire.request(str_URL,method: .post, parameters: parameters).responseJSON
            { (responseData) -> Void in
                
                
                
                
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.eventDefaultResponceLister!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.eventDefaultResponceLister!(response: responseDictionarys)
                }
        }
    }
    
    
    
}
