//
//  LoginParser.swift
//  ClubApp
//
//  Created by intellye labs on 11/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import Alamofire




@objc protocol logRespo : class
{
    @objc optional func loginResponceLister(response :NSDictionary)
}
class LoginParser:NSObject
{
    
    
    weak var delegate: logRespo?
    func loginCheck(username :String,password :String) {
        
        let parameters: Parameters = [
            "username": username,
            "password": password,
        
        ]

        
//        let str_URL = "http://intellyze.hol.es/ClubApp/api/v1/User_Login"
        let str_URL=Constants.BASEURL+"User_Login"
        
        print("URL",str_URL,parameters)
        
        Alamofire.request(str_URL,method: .post, parameters: parameters).responseJSON
            { (responseData) -> Void in
                
                print("\n JSON: \(responseData)")
          
                
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.loginResponceLister!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.loginResponceLister!(response: responseDictionarys)
                }
        }
    }
    

    
}
