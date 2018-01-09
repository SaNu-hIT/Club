//
//  EventViewController.swift
//  ClubApp
//
//  Created by intellye labs on 13/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import FSCalendar
import SVProgressHUD
 import SDWebImage
class EventViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource,FSCalendarDataSource, FSCalendarDelegate, UIGestureRecognizerDelegate,EventRespo {
    
    let eventparsor : EventParsor = EventParsor()
    var event : [Event] = []
    var events_info = NSArray()
    var event_list = NSArray()
    var date_array = NSArray()
    var image_array = NSArray()
    var  Event_id = NSArray()
    var Event_type_id=NSArray()
    var  event_date=NSArray()
    var  event_description=NSArray()
    var event_icon=NSArray()
    var event_time=NSArray()
    
    var event_title=NSArray()
    
    var  event_type_name=NSArray()
    var  event_venue=NSArray()

    
    
    
    
    var date = ["one","two","three","four","five","six"]
    
//    @IBOutlet weak var heightLayout: NSLayoutConstraint!
    
    @IBAction func sidemenu(_ sender: Any) {
        
        sideMenuViewController?._presentLeftMenuViewController()
    }
    
    @IBOutlet weak var table_view: UITableView!
//    @IBOutlet weak var calendar: FSCalendar!
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.eventparsor.delegate=self
        ShowProgress()
        eventparsor.eventCheck(userid: "1")
        

       }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell_events",for : indexPath) as! EventsViewCell
       cell.heading.text=event_title[indexPath.row] as? String
cell.event_description.text=event_description[indexPath.row] as? String

        let Image_Url=event_icon[indexPath.row]


       
        
         cell.event_image.sd_setImage(with: URL(string: Image_Url as! String), placeholderImage: UIImage(named: "avatar"))
        
        
var date = event_date[indexPath.row]
            print(date)     
     
        let dateFormatter = DateFormatter()

         dateFormatter.dateFormat = "dd-MM-yyyy"
        var s = dateFormatter.date(from:date as! String)
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: s!)
        let month = calendar.component(.month, from: s!)
        let years = calendar.component(.year, from: s!)

        
        var typeofevent=Event_type_id[indexPath.row] as? String
        
    
        if(typeofevent == "1")
        {
            cell.cell_view.backgroundColor = UIColor.red
        }
        
    if(typeofevent == "2")
        {
            cell.cell_view.backgroundColor = UIColor.blue
        }
       if(typeofevent == "3") 
        {
            cell.cell_view.backgroundColor = UIColor.green
        }
        
        cell.date_text.text = String(day)
        cell.weak_text.text = String(years)
                print(day)
            print(years)
          return (cell)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        print("Row: \(row)")
   
        
    
        var eid = Event_id[row] as! String
                var typeid = Event_type_id[row] as! String
        print("eid: \(typeid)")
        
        if(typeid == "1")
        {
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let VC_2 = storyBoard.instantiateViewController(withIdentifier: "eventdetails_view") as! EventDetailViewController
            VC_2.eventids = eid as! String
            self.present(VC_2, animated: true, completion: nil)
        }
        if(typeid == "2")
        {
         
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let VC_2 = storyBoard.instantiateViewController(withIdentifier: "meeting_view_controller") as! MettingViewController
            VC_2.eventids = eid as! String
            self.present(VC_2, animated: true, completion: nil)
        }
        else
        {
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let VC_2 = storyBoard.instantiateViewController(withIdentifier: "eventdetails_view") as! EventDetailViewController
            VC_2.eventids = eid as! String
            self.present(VC_2, animated: true, completion: nil)
        }
      
    }
    

    
    
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell=tableView.dequeueReusableCell(withIdentifier: "text_cell",for : indexPath) as! EventsViewCell
//        
//        
//        let even = event[indexPath.section]
//        let details = even.details[indexPath.row]
//        cell.heading.text=details.tittle
//        return cell
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        print("conunt in sections", event.count)
//        return event.count
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let events=event[section]
//        print("conunt", events.details.count)
//        return events.details.count
//    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let eve=event[section]
//        return eve.date
//    }
    
    
    
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
            table_view.reloadData()

            
            
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




