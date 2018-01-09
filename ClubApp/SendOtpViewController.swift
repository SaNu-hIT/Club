//
//  SendOtpViewController.swift
//  ClubApp
//
//  Created by intellye labs on 17/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import SVProgressHUD

class SendOtpViewController: UIViewController,otpListener {
    let sendotp : Sendotp = Sendotp()
    var tokens=""

    @IBAction func sendOtp(_ sender: Any) {
        
        
        
         var mobilenumber=username.text
        
        
        if( (mobilenumber?.characters.count)!>9)
        {
            ShowProgress()
           
            sendotp.sendOtp(mobilenumber: mobilenumber!)
        }
        else
        {
            
            let alert = UIAlertController(title: "Validation", message: "Required phone number", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
        }
       
        
    }
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        sendotp.delegate=self

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
    
    func ShowProgress()  {
        SVProgressHUD.show(withStatus: "Loading.")
        SVProgressHUD.setBackgroundColor(UIColor .white)
        SVProgressHUD.show()
        
    }
    
    
    func cancelProgress()  {
        
        SVProgressHUD.dismiss()
        
    }
    func otRespocneData(response: NSDictionary) {
        cancelProgress()
        print("respoce",response)
        if(response.value(forKey:"error") as! Bool?)!
        {
            
            
            
            print("error is true")
            // create the alert
            
        }
        else{
            
            
            var token=response.value(forKey: "Tocken") as! NSString
            
            var error = response.value(forKey: "error") as! NSObject
            
            var message = response.value(forKey: "message") as! NSString
            
            
            print("token",token)
        print("error",error)
            print("message",message)
            cancelProgress()
            
            
            
            
            
            
                        let storyboard = UIStoryboard(name: "Main", bundle: nil);
                        let vc = storyboard.instantiateViewController(withIdentifier:"verfy_otp") as! VerifyOtpViewController  // MySecondSecreen the storyboard ID
                  vc.tokens = token as String
                        self.present(vc, animated: true, completion: nil)


        }
        
    }


}
