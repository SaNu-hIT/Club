//
//  SidemenuViewController.swift
//  ClubApp
//
//  Created by intellye labs on 24/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class SidemenuViewController: UIViewController {
    var menus=["Profile","Notifictions","Admin","Contact us","Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()

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

//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell=tableView.dequeueReusableCell(withIdentifier: "data_cell",for : indexPath) as! SidemenuTableViewCell
////        cell.label.text=menus[indexPath.row] as! String
//        return (cell)
//        
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let row = indexPath.row
//        print("Row: \(row)")
//        
//        //        var contact=Contact_Id[row]
//        //
//        //        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        //        let VC_2 = storyBoard.instantiateViewController(withIdentifier: "profile_view") as! ProfileViewController
//        //        VC_2.contactid = contact as! String
//        //        self.present(VC_2, animated: true, completion: nil)
//        
//
//    }
    


}
