//
//  NewsViewController.swift
//  ClubApp
//
//  Created by intellye labs on 03/08/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,NewsRespo {
    
    
    var newsparsor:NewsPaser = NewsPaser()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newsparsor.delegate=self
        newsparsor.NewsResponce()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func newsrserespo(response: NSDictionary) {
  
    }

}
