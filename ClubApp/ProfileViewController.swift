//
//  ProfileViewController.swift
//  ClubApp
//
//  Created by intellye labs on 14/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProfileViewController: UIViewController,profileListner,UITableViewDataSource,UITableViewDelegate {
    
 
    var profileparsor : ProfileParser = ProfileParser()
    var contactid=""
    var contactInfo = NSArray()
    var names = NSArray()
    var Child_Info = NSObject()
    @IBOutlet weak var profile_table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         profile_table.delegate = self
        profile_table.dataSource = self
        ShowProgress()
        
        
        
        profileparsor.delegate=self
        profileparsor.getProfileResponce(Contact_Id: "1")
        
        
        

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("name count",names.count)
        
        if section == 0{
           
            return 1
        }
        else if section == 1
        {
            //return names.count
            
            return 3
        }
        else
        {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("indexPath",indexPath.row)
         print("indexPath secsion",indexPath.section)
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell") as! profileTableViewCell
            
//            cell.conview1.layer.borderWidth = 1
//            cell.conview1.layer.borderColor = UIColor.lightGray.cgColor
            
            return cell
        }
        else if indexPath.section == 1{
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell1") as! profileTableViewCell1
            cell3.conview2.layer.borderWidth = 1
            cell3.conview2.layer.borderColor = UIColor.red.cgColor
            print("indexPath inside",indexPath)
           // print("names main",names[indexPath.row])
         cell3.phone.text = names[indexPath.row] as? String
            cell3.phone.text = "hai tesing"
            
            return cell3
            
        }
        else if indexPath.section == 2
        {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell2") as! profileTableViewCell2
            
            cell1.conview3.layer.borderWidth = 1
            cell1.conview3.layer.borderColor = UIColor.blue.cgColor
            return cell1
            
        }
            
        else
        {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell2") as! profileTableViewCell2
            return cell1
        }
       // profile_table.reloadData()
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back_butt(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "sidemenu") as! SSASideMenu
        self.present(secondViewController, animated: false, completion: nil)
        
    }
    
    func profileResponceData(response: NSDictionary) {

        cancelProgress()
        contactInfo=(response.value(forKey: "contact_info") as? NSArray)!
        print("contact info",contactInfo)
        var contactid = contactInfo.value(forKey: "Contact_Id")
        var FullName = contactInfo.value(forKey: "FullName")
        var address = contactInfo.value(forKey: "address")
        var dob = contactInfo.value(forKey: "dob")
        var email = contactInfo.value(forKey: "email")
        

            Child_Info=contactInfo.value(forKey: "Child_Info") as! NSObject
        
        names = Child_Info.value(forKey: "name") as! NSArray
        
        print("names",names)
        
              print("FullName",FullName)
    profile_table.reloadData()
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        if indexPath.row == 0 {
            height = 189
        }
        else if indexPath.row == 1 {
            height = 164
        }
        else
        {
            height = 149
        }
       
        
        return height
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
