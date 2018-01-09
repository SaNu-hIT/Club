//
//  EventDetailViewController.swift
//  ClubApp
//
//  Created by intellye labs on 03/08/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import PopupDialog
class EventDetailViewController: UIViewController,EventSingleRespo {
    var eventids=""
    
    var eventsinfo = NSArray()
    var datearray = NSArray()
    var eventlist = NSObject()
    @IBOutlet weak var showProfile: UIButton!
    

    @IBOutlet weak var table_views: UITableView!
    
    @IBAction func shreWhatsapp(_ sender: Any) {
        
        
        let date = Date()
        let msg = "Hi my dear friends\(date)"
        let urlWhats = "whatsapp://send?text=\(msg)"
        
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = NSURL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                    UIApplication.shared.openURL(whatsappURL as URL)
                } else {
                    
                    
                    let title = "Whatsapp not Installed"
                    let message = "Whatsapp is not installed on your device"
                    let image = UIImage(named: "whatsappgray")
                    
                    // Create the dialog
                    let popup = PopupDialog(title: title, message: message)
                    
                    // Create buttons
                    let buttonOne = CancelButton(title: "OK") {
                        print("You canceled the car dialog.")
                    }
                    
                 
                    popup.addButtons([buttonOne])
                    
                    // Present dialog
                    self.present(popup, animated: true, completion: nil)
                  
                }
            }
        }
        
        
        
    }
    
    
    @IBAction func callNumber(_ sender: Any) {
        
    var phoneNumber = "8606276916"
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
        
    }
    
    
    
    @IBAction func SendMessage(_ sender: Any) {
        
        
        
        
    }
    
    @IBAction func onbackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    var Event_id = NSArray()
    var event_description = NSArray()
    var event_icon = NSArray()

    var event_time = NSArray()
    var event_title = NSArray()

        var event_type_name = NSArray()
    
    @IBOutlet weak var tittleimage_virew: UIImageView!
    
    @IBOutlet weak var event_titte_text: UILabel!
    
    @IBOutlet weak var name_text: UILabel!
    @IBOutlet weak var dateofbirth_text: UILabel!
    
    var eventsingle : EventSingleParsor=EventSingleParsor()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        eventsingle.delegate=self
             print("eventids",eventids)
        let user_id=UserDefaults.standard.string(forKey: "user_id")
        print("user_id",user_id)

            var eventid=eventids
        eventsingle.eventCheck(userid: user_id!, Event_id: eventid)
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func eventSingleResponceLister(response: NSDictionary) {
print("responce",response)
        
//        eventsinfo=response.value(forKey: "events_info") as! NSArray
//           eventlist=eventsinfo.value(forKey: "event_list") as! NSObject
//                   datearray=eventsinfo.value(forKey: "date") as! NSArray
//      
//        
//        Event_id = eventlist.value(forKey: "Event_id") as! NSArray
//        
//        print("eventlist",eventlist)
//        
//        event_description = eventlist.value(forKey: "event_description") as! NSArray
//        event_icon = eventlist.value(forKey: "event_icon") as! NSArray
//        event_time = eventlist.value(forKey: "event_time") as! NSArray
//        event_title = eventlist.value(forKey: "event_title") as! NSArray
//        event_type_name = eventlist.value(forKey: "event_type_name") as! NSArray
//        
//        var eventlist_string=eventlist.value(forKey: "eventlist");
//      
//          var  eventdate=datearray[0]
//        
//        
//          var eventid=NSArray()
//          var event_titles=NSArray()
//        var event_type_namearrya=NSArray()
//        
//   var imagearray=NSArray()
//     
//        
//         eventid=Event_id[0]as! NSArray
//         event_titles=event_title[0]as! NSArray
//        event_type_namearrya=event_type_name[0] as! NSArray
//    imagearray=event_icon[0] as! NSArray
//        
//        var event_tittle=event_titles[0]as! String
//       
//        
//        var event_type=event_type_namearrya[0]as! String
//        
//        
//        
//               var Image_Url=imagearray[0]as! String
//        self.event_titte_text.text=event_type
//        self.name_text.text=event_tittle as? String
//        self.dateofbirth_text.text=eventdate as? String
//        
//
//
//        
//        
//        self.tittleimage_virew.sd_setImage(with: URL(string: Image_Url as! String), placeholderImage: UIImage(named: "avatar"))
//
        


        
    }
    
    
    

}
