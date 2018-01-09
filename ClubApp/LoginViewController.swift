//
//  LoginViewController.swift
//  ClubApp
//
//  Created by intellye labs on 11/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController,logRespo,UITextFieldDelegate {
    let loginObject : LoginParser = LoginParser()
    var user_info=NSArray()
        var profile_image=NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        loginObject.delegate = self;
       
        

        // Do any additional setup after loading the view.
    }

    @IBAction func forgetPassword(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"signup_view_controller"); // MySecondSecreen the storyboard ID
        self.present(vc, animated: true, completion: nil)
        

    }
    
    
    
    @IBAction func signUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"signup_view_controller"); // MySecondSecreen the storyboard ID
        self.present(vc, animated: true, completion: nil)
        

    }
    
    
    @IBOutlet weak var password_text: UITextField!
    @IBOutlet weak var usename_txt: UITextField!
    @IBAction func Login(_ sender: Any) {
        
        
        var use=usename_txt.text as! String
        
          var pass=password_text.text  as! String
        
        if( (use.characters.count)>9 && (pass.characters.count)>0)
        {
            ShowProgress()
        LoginUser(username: use, password: pass)
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
    func validate(value: String) -> Bool {
        let PHONE_REGEX = "1234567890"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
   
    func LoginUser(username:String,password:String)  {
        
  loginObject.loginCheck(username: username, password:password)
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
    func loginResponceLister(response: NSDictionary) {
        
        
        cancelProgress()
        if(response.value(forKey:"error") as! Bool?)!
        {
            
         
            print("error is true")
            // create the alert
            let alert = UIAlertController(title: "Login Failed.", message: "Username or password incorrect", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        
        }
        else{
            var userinfo = response.value(forKey: "user_info") as! NSArray
            
            print("user_info",userinfo)
            
//            var useid=userinfo.value(forKey: "user_id") as! NSArray
            var userids=userinfo.object(at: 0) as! NSObject
     
               print("userids",userids)
            
            var sss=userids.value(forKey: "user_id") as! String
             var role=userids.value(forKey: "role") as! String
               print("role",role)
            UserDefaults.standard.setValue(sss, forKey: "user_id")
            UserDefaults.standard.setValue(role, forKey: "role")
         
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier:"tabview_controlller"); // MySecondSecreen the storyboard ID
            self.present(vc, animated: true, completion: nil)
            
        
//        print("Login responce",response)
//         user_info = response.value(forKey: "user_info") as! NSArray
//         profile_image=user_info.value(forKey: "Profile_Url") as! NSArray
//        print("proile imahe",profile_image)
            
        }
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    func ShowProgress()  {
        SVProgressHUD.show(withStatus: "Loading.")
        SVProgressHUD.setBackgroundColor(UIColor .white)
        SVProgressHUD.show()
        
    }
    
    
    func cancelProgress()  {
        
        SVProgressHUD.dismiss()
        
    }

    

}
