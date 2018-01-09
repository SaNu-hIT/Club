//
//  AddPhotoParsor.swift
//  ClubApp
//
//  Created by intellye labs on 28/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import Foundation
import Foundation
import Alamofire




@objc protocol AddPhotoRespo : class
{
    @objc optional func AddPhotoResponceLister(response :NSDictionary)
}
class AddPhotoParsor :NSObject {
    
    
    weak var delegate: AddPhotoRespo?
    func AddPhoto(image: [String],caption: String) {
        
        print("image",image)
                print("caption",caption)
        
        let str_URL=Constants.BASEURL+"add_sidebar_image"
        for i in 0..<image.count
        {
            
  
        var imageurl = image[i]
        
        let parameters: Parameters = [
            "image_base": imageurl,
            "filename": caption,
            
            ]
        

        
        Alamofire.request(str_URL,method: .post,parameters: parameters).responseJSON
            { (responseData) -> Void in
                
                print("\n JSON: \(responseData)")
                
                
                
                
                if let JSON = (responseData.result.value) {
                    
                    let dictionaryValue: NSDictionary = JSON as! NSDictionary
                    self.delegate?.AddPhotoResponceLister!(response: dictionaryValue)
                    
                }
                else
                {
                    let responseDictionarys: NSDictionary = ["error" : true]
                    print("\n JSON: \(responseDictionarys)")
                    self.delegate?.AddPhotoResponceLister!(response: responseDictionarys)
                }
        }
            }
    }
    
    
    
    
    
}
