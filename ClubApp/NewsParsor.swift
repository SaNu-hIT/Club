//
//  NewsParsor.swift
//  ClubApp
//
//  Created by intellye labs on 03/08/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation
import Alamofire
@objc protocol NewsRespo : class
{
    @objc optional func newsrserespo(response :NSDictionary)
}
class NewsPaser:NSObject
{
    
    
    weak var delegate : NewsRespo?
    func NewsResponce() {
        
        
        
    
        let str_URL=Constants.BASEURL+"list_news"
        
        
        Alamofire.request(str_URL,method: .post).responseJSON
            { (responseData) -> Void in
                
   
                
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.newsrserespo!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    
                    self.delegate?.newsrserespo!(response: responseDictionarys)
                }
        }
    }
    
    
}
