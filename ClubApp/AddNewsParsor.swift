//
//  AddNewsParsor.swift
//  ClubApp
//
//  Created by intellye labs on 01/08/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation
import Alamofire


@objc protocol AddNewsRespo : class
{
    @objc optional func AddNewsResponceLister(response :NSDictionary)
}
class AddNewsParsor :NSObject {
    
    
    weak var delegate: AddNewsRespo?
    func Addnews(image: [String],caption: String,description: String,dates: String) {
        

        
        let str_URL=Constants.BASEURL+"create_news_json"
        var imagearray = [String: Any]()
     

                     for i in 0 ..< image.count {
       imagearray = ["imagedata": image[i],"fileName":"sadsa.png"]
    }

        
        var parameters:[String: Any] = [
            "news_title": caption,
            "news_description": description,
            "news_date": dates,
            
            "image_list": imagearray
            
              ]
          
    
print("parametrs",parameters)
    
        
            Alamofire.request(str_URL,method: .post,parameters: parameters, encoding: JSONEncoding.default).responseJSON
                { (responseData) -> Void in
                    
                    print("\n JSON: \(responseData)")
                    
                    
                    
                    
                    if let JSON = (responseData.result.value) {
                        
                        let dictionaryValue: NSDictionary = JSON as! NSDictionary
                        self.delegate?.AddNewsResponceLister!(response: dictionaryValue)
                        
                    }
                    else
                    {
                        let responseDictionarys: NSDictionary = ["error" : true]
                        print("\n JSON: \(responseDictionarys)")
                        self.delegate?.AddNewsResponceLister!(response: responseDictionarys)
                    }
            }
        
    }
    
    
    
    
    
}
