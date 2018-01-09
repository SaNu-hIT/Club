//
//  EventType.swift
//  ClubApp
//
//  Created by intellye labs on 27/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation
import Alamofire




@objc protocol EventTypeRespo : class
{
    @objc optional func EventtypeResponceLister(response :NSDictionary)
}
class EventType :NSObject {
    
    
    weak var delegate: EventTypeRespo?
    func getEventType() {
        
      
        
        
        let str_URL=Constants.BASEURL+"list_Event_Type"
        
  
        
        Alamofire.request(str_URL,method: .post).responseJSON
            { (responseData) -> Void in
                
                print("\n JSON: \(responseData)")
                
                
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.EventtypeResponceLister!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.EventtypeResponceLister!(response: responseDictionarys)
                }
        }
    }
    
    
    
    
    
}
