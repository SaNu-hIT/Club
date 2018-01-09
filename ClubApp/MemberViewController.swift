//
//  MemberViewController.swift
//  ClubApp
//
//  Created by intellye labs on 13/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import SVProgressHUD

class MemberViewController: UIViewController,MemberRespo,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var table_view: UITableView!
    let memberobject : MemberPaser = MemberPaser()
    var Child_Info = NSArray()
    var Contact_Id=NSArray()
    var FullName = NSArray()
    var mobile_no = NSArray()
    
    var getdata = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        ShowProgress()
    table_view.delegate = self
        memberobject.delegate = self
        memberobject.memberRespo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contact_Id.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "member_cell",for : indexPath) as! MemberCell
        cell.name.text=FullName[indexPath.row] as! String
        return (cell)
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        print("Row: \(row)")
        
        var contact=Contact_Id[row]
//
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC_2 = storyBoard.instantiateViewController(withIdentifier: "profile_view") as! ProfileViewController
        VC_2.contactid = contact as! String
        self.present(VC_2, animated: true, completion: nil)
        
        print(FullName[row] as! String)
    }

    
    func memberserespo(response: NSDictionary) {
        cancelProgress()

        if(response.value(forKey:"error") as! Bool?)!
        {
          
            cancelProgress()
     print("error is true")
            
            let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
           
        }
        else{
            getdata=response.value(forKey: "contact_info") as! NSArray

            Contact_Id = getdata.value(forKey: "Contact_Id") as! NSArray
     
            FullName = getdata.value(forKey: "name") as! NSArray
          
            mobile_no = getdata.value(forKey: "mobile_no") as! NSArray

        }
        
        
    self.table_view.reloadData()
        cancelProgress()
        
        
    }
    
    func ShowProgress()  {
        SVProgressHUD.show(withStatus: "Loading.")
        SVProgressHUD.setBackgroundColor(UIColor .white)
        SVProgressHUD.show()
        
    }

    func cancelProgress()  {
    
        SVProgressHUD.dismiss()
        
    }
    
    
    @IBAction func sideButtonClicked(_ sender: Any) {
        
        print("open side menu")
        sideMenuViewController?._presentLeftMenuViewController()
        
    }
    
    
    
    
    
    open func toggleDrawer(_ animated: Bool = true) {
        if let sideDrawerViewController = self.sideDrawerViewController {
            sideDrawerViewController.toggleDrawer()
        }
    }
    
    

}
