//
//  AddEventViewController.swift
//  ClubApp
//
//  Created by intellye labs on 26/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import DropDown
import SVProgressHUD
import DateTimePicker
class AddEventViewController: UIViewController,addEventRespo,EventTypeRespo {
    let addeventss : AddEvents = AddEvents()
    let eventType : EventType = EventType()
    var spinnerid = ""
    let dropDown = DropDown()
    var event_Type_id = NSArray()
    var event_type_name=NSArray()
    var getdata=NSArray()
   

    @IBAction func openCal(_ sender: Any) {
               openCalender()
    }
    @IBAction func oepndate(_ sender: Any) {

    }
    @IBOutlet weak var open_dropdown: UIButton!

    @IBOutlet weak var view_dropdown: UIView!
    @IBAction func backClick(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
      
    }
    @IBAction func addevent(_ sender: Any) {
        if(!validate())
        {
            ShowProgress()
        addeventss.createEvent(type_id: spinnerid, event_title: title_text.text!, event_date: date_text.text!, event_time: time_text.text!, event_venue: venue_text.text!, event_description: description_text.text!)
        }
    }
    @IBAction func showDropdown(_ sender: Any) {
        dropDown.show()
    }
    @IBAction func cancel(_ sender: Any) {
    }
    @IBOutlet weak var description_text: UITextField!
    @IBOutlet weak var venue_text: UITextField!
    @IBOutlet weak var time_text: UITextField!
    @IBOutlet weak var date_text: UITextField!
    @IBOutlet weak var title_text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ShowProgress()
        addeventss.delegate = self
        eventType.delegate = self
        eventType.getEventType()

        open_dropdown.layer.cornerRadius = 1;
        open_dropdown.layer.borderWidth = 1;
        
    let color = UIColor(hex: "448AFF")
        open_dropdown.layer.borderColor = UIColor.blue.cgColor
        
//        init(ciColor: #448AFF)
       

        // The view to which the drop down will appear on
        dropDown.anchorView = open_dropdown // UIView or UIBarButtonItem
        
        // The list of items to display. Can be changed dynamically
       
        dropDown.selectionAction={ [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.open_dropdown.setTitle(item, for: .normal)
            self.spinnerid=self.event_Type_id[index] as! String
            print(self.spinnerid)
            
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func validate() -> Bool {
         var flag=false
        var title=title_text.text;
         var date=date_text.text;
         var time=time_text.text;
        var venue=venue_text.text;
        var description=description_text.text;
        if(!(title?.isEmpty)!)
        {
         var flag=true
            if(!(date?.isEmpty)!)
            { flag=true
               
                if(!(time?.isEmpty)!)
                {
                            flag=true
                    if(!(venue?.isEmpty)!)
                    {
                                 flag=true
                        if(!(description?.isEmpty)!)
                        {
                                     flag=true
                            
                            if(spinnerid.characters.count>0)
                            {
                                flag=true
                                
                            }
                            else
                            {
                                flag=false
                                Alertuser(message: "Select event type")
                                
                            }
                            
                            
                            
                            
                        }
                        else
                        {
                                     flag=false
                            Alertuser(message: "Enter description")
                            
                        }
                        
                    }
                    else
                    {    flag=false
                        
                        Alertuser(message: "Enter venue")
                        
                    }
                    
                }
                else
                {    flag=false
                    Alertuser(message: "Enter time")
                    
                }
                
            }
            else
            {
                    flag=false
                Alertuser(message: "Enter date")
                
            }
        }
        else
        {
                flag=false
            Alertuser(message: "Enter title")
            
        }
        return flag
    }
    func Alertuser(message : String)  {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    func AlertuserSuccess(message : String)  {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

    
    
    func ShowProgress()  {
        SVProgressHUD.show(withStatus: "Loading.")
        SVProgressHUD.setBackgroundColor(UIColor .white)
        SVProgressHUD.show()
        
    }
    
    
    func cancelProgress()  {
        
        SVProgressHUD.dismiss()
        
    }

    
    func addEventResponceLister(response: NSDictionary) {
        cancelProgress()
        print("hai",response)
        
        
        if(response.value(forKey:"error") as! Bool?)!
        {
            
            
            
        }
        else{
            
            
            
            description_text.text=""
            venue_text.text=""
            time_text.text=""
            date_text.text=""
            title_text.text=""
            var  message = response.value(forKey: "message")
            AlertuserSuccess(message: message as! String)
            
            
            
        }
        cancelProgress()
    }
    
    func EventtypeResponceLister(response: NSDictionary) {
      
        
        if(response.value(forKey:"error") as! Bool?)!
        {
            
     
            print("error is true")
            
        }
        else{
            
            
             getdata=response.value(forKey: "Event_Type_info") as! NSArray
            event_Type_id=getdata.value(forKey: "event_Type_id") as! NSArray
            
            event_type_name = getdata.value(forKey: "event_type_name") as! NSArray
            
            print("event_Type_id",event_Type_id)
            
            print("event_type_name",event_type_name)
            
             dropDown.dataSource = event_type_name as! [String]
           
        }
          cancelProgress()


    }
    func openCalender() {
        let min = Date()
        let max = Date().addingTimeInterval(60 * 60 * 24 * 10)
        let picker = DateTimePicker.show(minimumDate: min)
        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.darkColor = UIColor.darkGray
        picker.doneButtonTitle = "DONE !"
        picker.todayButtonTitle = "Today"
        picker.is12HourFormat = true
        picker.dateFormat = "hh:mm aa dd/MM/YYYY"
        //        picker.isDatePickerOnly = true
        picker.completionHandler = { date in
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm aa dd/MM/YYYY"
            
            let formatdate = DateFormatter()
            formatdate.dateFormat = "dd-MM-YYYY"
            let formattime = DateFormatter()
            formattime.dateFormat = "hh:mm aa"
            print(formatter.string(from: date))
            //            self.item.title = formatter.string(from: date)
            var dates=formatdate.string(from: date)
             var times=formattime.string(from: date)
            print(dates)
                   print(times)
            
            
            self.date_text.text=dates
            self.time_text.text=times
        }

    }
    
    
    

}


extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
