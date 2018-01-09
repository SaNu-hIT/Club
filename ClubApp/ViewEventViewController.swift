//
//  ViewEventViewController.swift
//  ClubApp
//
//  Created by intellye labs on 15/09/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import SVProgressHUD
class ViewEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,EventRespo {
let eventparsor : EventParsor = EventParsor()
    
    var event : [Event] = []
    var events_info = NSArray()
    var event_list = NSArray()
    var date_array = NSArray()
    var image_array = NSArray()
    
    
    
    @IBAction func onBackClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var  Event_id = NSArray()
    
    var Event_type_id=NSArray()
    
    var  event_date=NSArray()
    
    var  event_description=NSArray()
    
    var event_icon=NSArray()
    
    
    
    var event_time=NSArray()
    
    var event_title=NSArray()
    
    var  event_type_name=NSArray()
    var  event_venue=NSArray()
    
    

    @IBOutlet weak var tableview: UITableView!
    
    var data = ["Add event","Add News","View Event Details","View News","Add Photos","Contact Developer"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self
        self.eventparsor.delegate=self
        ShowProgress()
        eventparsor.eventCheck(userid: "1")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell_details",for : indexPath) as! EventDetailsTableViewCell
//        cell.event_tittle.text="hai"
        
        
        cell.event_tittle.text=event_title[indexPath.row] as? String
        cell.event_description.text=event_description[indexPath.row] as? String
        
        let Image_Url=event_icon[indexPath.row]
        
        
        
        
        cell.images.sd_setImage(with: URL(string: Image_Url as! String), placeholderImage: UIImage(named: "avatar"))
        
       
        return (cell)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
                
    }
    
    
    func eventResponceLister(response: NSDictionary) {
        
        if(response.value(forKey:"error") as! Bool?)!
        {
            
            cancelProgress()
            print("error is true")
            
        }
        else{
            
            
            events_info=response.value(forKey: "events_info") as! NSArray
            print("events_info",events_info)
            Event_id=events_info.value(forKey: "Event_id") as! NSArray
            
            Event_type_id=events_info.value(forKey: "Event_type_id") as! NSArray
            
            event_date=events_info.value(forKey: "event_date") as! NSArray
            
            event_description=events_info.value(forKey: "event_description") as! NSArray
            
            event_icon=events_info.value(forKey: "event_icon") as! NSArray
            
            
            
            event_time=events_info.value(forKey: "event_time") as! NSArray
            
            event_title=events_info.value(forKey: "event_title") as! NSArray
            
            event_type_name=events_info.value(forKey: "event_type_name") as! NSArray
            
            event_venue=events_info.value(forKey: "event_venue") as! NSArray
            tableview.reloadData()
            
            
            
        }
        
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
    
    
    


}
