//
//  EventParsor.swift
//  ClubApp
//
//  Created by intellye labs on 26/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation


import UIKit
import Alamofire




@objc protocol EventRespo : class
{
    @objc optional func eventResponceLister(response :NSDictionary)
}
class EventParsor:NSObject
{
    
    
    weak var delegate: EventRespo?
    func eventCheck(userid :String) {
        
      
        
        let parameters: Parameters = [
            "User_Id": ""
            
        ]
        let str_URL=Constants.BASEURL+"list_events_default"
   
        
        Alamofire.request(str_URL,method: .post, parameters: parameters).responseJSON
            { (responseData) -> Void in
                
 
                
//       print("responseData",responseData)
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.eventResponceLister!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.eventResponceLister!(response: responseDictionarys)
                }
        }
    }
    
    
    
}
