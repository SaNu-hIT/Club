//
//  SplashViewController.swift
//  ClubApp
//
//  Created by intellye labs on 31/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user_id=UserDefaults.standard.string(forKey: "user_id")
        print("user_id",user_id)

        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5)
        {
            
            print(user_id)

            //              self.performSegue(withIdentifier: "homeViewController", sender: self)
            if user_id==nil {
                
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil);
                let vc = storyboard.instantiateViewController(withIdentifier:"loginviewcotroller"); // MySecondSecreen the storyboard ID
                
                
                self.present(vc, animated: true, completion: nil)
            }
            else
            {
                if (user_id?.characters.count)!>0
                {
                    
                    
                    
                    //                    self.performSegue(withIdentifier: "dashb", sender: self)
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil);
                    let vc = storyboard.instantiateViewController(withIdentifier:"tabview_controlller"); // MySecondSecreen the storyboard ID
                    
                    
                    self.present(vc, animated: true, completion: nil)
                    
                }
            }
            print("HI wit delay")
            
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
