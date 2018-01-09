//
//  Sendotp.swift
//  ClubApp
//
//  Created by intellye labs on 17/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation
import Alamofire

@objc protocol otpListener : class{
    
    @objc optional func otRespocneData(response :NSDictionary)
    
}
class Sendotp:NSObject
{
    
    
    weak var delegate: otpListener?
    func sendOtp(mobilenumber : String) {
        
        let parameters: Parameters = [
            "username": mobilenumber
            
            
        ]
        
        
        //        let str_URL = "http://intellyze.hol.es/ClubApp/api/v1/list_contacts"
        let str_URL=Constants.BASEURL+"SendOTP"
        
        print("URL",str_URL,parameters)
        
        Alamofire.request(str_URL,method: .post, parameters: parameters).responseJSON
            { (responseData) -> Void in
                
                
                
                
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.otRespocneData!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.otRespocneData!(response: responseDictionarys)
                }
        }
    }
    

    
}
