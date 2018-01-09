//
//  AddEvents.swift
//  ClubApp
//
//  Created by intellye labs on 26/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import Alamofire




@objc protocol addEventRespo : class
{
    @objc optional func addEventResponceLister(response :NSDictionary)
}
class AddEvents :NSObject {
    
    
    weak var delegate: addEventRespo?
    func createEvent(type_id :String,event_title :String,event_date :String,event_time :String,event_venue :String,event_description :String) {
        
        let parameters: Parameters = [
            "type_id": type_id,
            "event_title": event_title,
            "event_date": event_date,
            "event_time": event_time,
            "event_venue": event_venue,
            "event_description": event_description
            ]

        print("createEvent","createEvent")
      
        let str_URL=Constants.BASEURL+"create_events"
        
        print("URL",str_URL,parameters)
        
        Alamofire.request(str_URL,method: .post, parameters: parameters).responseJSON
            { (responseData) -> Void in
                
                print("\n JSON: \(responseData)")
                
                
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.addEventResponceLister!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.addEventResponceLister!(response: responseDictionarys)
                }
        }
    }
    
    

    

}
