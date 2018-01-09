//
//  LeftMenuViewController.swift
//  ClubApp
//
//  Created by ArunMadav on 7/24/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//
import Foundation
import UIKit

class LeftMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
  
    @IBOutlet weak var pro_img: UIImageView!
    var user = false
    
    var menus_admin=["Profile","Notifictions","Admin","Contact us","Log Out"]
      var menus_user=["Profile","Notifictions","Contact us","Log Out"]
    let assetArray = ["profile_img", "notification_nav","admin_nav","contactus","logout"]
      let assetArray_user = ["profile_img", "notification_nav","contactus","logout"]
   
    @IBOutlet weak var lft_tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       pro_img.layer.cornerRadius = pro_img.frame.size.width/2
       pro_img.clipsToBounds = true
        
        var role = UserDefaults.standard.string(forKey: "role")
        
        
        print("role",role)
        if(role=="User")
        {
         user = true
        }
        else{
            user = false
        }

        //tableview.delegate=self
        
 //tableview.dataSource=self
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(user)
        {
            
        
        return menus_user.count
        }
        else
        {
            return menus_admin.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "SidemenuTableViewCell",for : indexPath) as! SidemenuTableViewCell
        if(user)
        {
        cell.lbl.text=menus_user[indexPath.row]
        cell.img.image = UIImage(named: (assetArray_user[indexPath.row]+".jpg"))
        }
        else
        {
            cell.lbl.text=menus_admin[indexPath.row]
            cell.img.image = UIImage(named: (assetArray[indexPath.row]+".jpg"))
        }
        
       
        return (cell)

      
        
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Row: ")
            let row = indexPath.row
            print("Row: \(row)")
            if (!user)
            {
            if(row==0)
            {
               let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let secondViewController = storyBoard.instantiateViewController(withIdentifier: "profile_view") as! ProfileViewController
                self.present(secondViewController, animated: false, completion: nil)
            }
            else if(row==1)
            {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let secondViewController = storyBoard.instantiateViewController(withIdentifier: "notification_viewcontroller") 
                self.present(secondViewController, animated: false, completion: nil)
            }
            else if(row==2)
            {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let secondViewController = storyBoard.instantiateViewController(withIdentifier: "AdminViewController") as! AdminViewController
                self.present(secondViewController, animated: false, completion: nil)
            }
            else if(row==3)
            {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let secondViewController = storyBoard.instantiateViewController(withIdentifier: "contact_us")
                self.present(secondViewController, animated: false, completion: nil)
            }
            else if(row==4)
            {
              LogOut()
            }
            }
            else
            {

                if(row==0)
                {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let secondViewController = storyBoard.instantiateViewController(withIdentifier: "profile_view") as! ProfileViewController
                    self.present(secondViewController, animated: false, completion: nil)
                }
                else if(row==1)
                {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let secondViewController = storyBoard.instantiateViewController(withIdentifier: "notification_viewcontroller")
                    self.present(secondViewController, animated: false, completion: nil)
                }
                else if(row==2)
                {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let secondViewController = storyBoard.instantiateViewController(withIdentifier: "contact_us")
                    self.present(secondViewController, animated: false, completion: nil)
                }
                else if(row==3)
                {
                    LogOut()
                  
                }
               
            }
            

        }
    
    
    
    func LogOut()   {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "loginviewcotroller") as! LoginViewController
        self.present(secondViewController, animated: false, completion: nil)

        
        
    }
}
