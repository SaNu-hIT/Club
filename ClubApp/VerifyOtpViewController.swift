//
//  VerifyOtpViewController.swift
//  ClubApp
//
//  Created by intellye labs on 17/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class VerifyOtpViewController: UIViewController,UITextFieldDelegate {
var tokens=""
    
    @IBOutlet weak var fourth_text: UITextField!
    @IBOutlet weak var third_text: UITextField!
    @IBOutlet weak var second_text: UITextField!
    @IBOutlet weak var first_text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        var data=tokens
        first_text.delegate=self
print("data",data)
        // Do any additional setup after loading the view.
    }
    
    func textViewDidChange(textView: UITextView) { //Handle the text changes here
        print(textView.text); //the textView parameter is the textView where text was changed
    }
    func textViewDidEndEditing(textView: UITextView) {
        // your code here.
        print(textView.text);
    }
   

    @IBAction func proceedwithnewpassword(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"pop_up_view")as! PopupViewController  // MySecondSecreen the storyboard ID
     
        self.present(vc, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
