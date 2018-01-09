//
//  MemberPaser.swift
//  ClubApp
//
//  Created by intellye labs on 13/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import Alamofire



@objc protocol MemberRespo : class
{
    @objc optional func memberserespo(response :NSDictionary)
}
class MemberPaser:NSObject
{
    
    
    weak var delegate : MemberRespo?
    func memberRespo() {
      
        
        
        //        let str_URL = "http://intellyze.hol.es/ClubApp/api/v1/User_Login"
        let str_URL=Constants.BASEURL+"list_contacts"
        

        Alamofire.request(str_URL,method: .post).responseJSON
            { (responseData) -> Void in
                
//                print("\n JSON: \(responseData)")
                
                
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.memberserespo!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
//                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.memberserespo!(response: responseDictionarys)
                }
        }
    }
    
    
}
