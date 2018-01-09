//
//  AttendingParsor.swift
//  ClubApp
//
//  Created by intellye labs on 08/08/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation

import Alamofire




@objc protocol attendRespo : class
{
    @objc optional func attendResponceLister(response :NSDictionary)
}
class AttendingParsor:NSObject
{
    
    
    weak var delegate: attendRespo?
    func AttendEvent(event_id :String,userId :String,attendVal:String) {
        
        let parameters: Parameters = [
            "event_id": event_id,
            "userId": userId,
               "attendVal": attendVal
            
            ]

        let str_URL=Constants.BASEURL+"attend_an_event"
        
        print("URL",str_URL,parameters)
        
        Alamofire.request(str_URL,method: .post, parameters: parameters).responseJSON
            { (responseData) -> Void in
                
                print("\n JSON: \(responseData)")
                
                
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.attendResponceLister!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.attendResponceLister!(response: responseDictionarys)
                }
        }
    }
    
    
    
}
