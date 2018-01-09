//
//  ProfileParser.swift
//  ClubApp
//
//  Created by intellye labs on 14/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation
import Alamofire

@objc protocol profileListner : class
{
    @objc optional func profileResponceData(response :NSDictionary)
    
    
}

class ProfileParser: NSObject {
 
    
    weak var delegate: profileListner?
    func getProfileResponce(Contact_Id : String) {
        
        let parameters: Parameters = [
            "Contact_Id": Contact_Id

    
            ]
        
        
        //        let str_URL = "http://intellyze.hol.es/ClubApp/api/v1/list_contacts"
        let str_URL=Constants.BASEURL+"list_contacts"
        
        print("URL",str_URL,parameters)
        
        Alamofire.request(str_URL,method: .post, parameters: parameters).responseJSON
            { (responseData) -> Void in
                
               
                
                
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.profileResponceData!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.profileResponceData!(response: responseDictionarys)
                }
        }
    }
    

}
