//
//  EventSinglePasror.swift
//  ClubApp
//
//  Created by intellye labs on 03/08/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation

import UIKit
import Alamofire




@objc protocol EventSingleRespo : class
{
    @objc optional func eventSingleResponceLister(response :NSDictionary)
}
class EventSingleParsor:NSObject
{
    
    
    weak var delegate: EventSingleRespo?
    func eventCheck(userid :String,Event_id:String) {
        
        
        
        let parameters: Parameters = [
            "User_Id": userid,"Event_id":Event_id
            
        ]
        print("parameter",parameters)
        let str_URL=Constants.BASEURL+"list_events"
        
        
        Alamofire.request(str_URL,method: .post, parameters: parameters).responseJSON
            { (responseData) -> Void in
                
                
                

                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.eventSingleResponceLister!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.eventSingleResponceLister!(response: responseDictionarys)
                }
        }
    }
    
    
    
}
