
import UIKit
import SVProgressHUD
import PopupDialog

class MettingViewController: UIViewController,EventSingleRespo,attendRespo {

    var eventids=""
    
    @IBAction func attending(_ sender: Any) {
        ShowProgress()
        AttendOrDecly(yesorno: "Yes")
        
        
    }

    
    @IBAction func notAtttending(_ sender: Any) {
        ShowProgress()
         AttendOrDecly(yesorno: "No")
    }
    
    
    @IBOutlet weak var image_view: UIImageView!
    var eventsinfo = NSArray()
    var datearray = NSArray()
    var eventlist = NSObject()
        var event_venue = NSArray()
    
    var eventsingle : EventSingleParsor=EventSingleParsor()

     var attendparsor : AttendingParsor=AttendingParsor()
    @IBAction func onbackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    var Event_id = NSArray()
    var event_description = NSArray()
    var event_icon = NSArray()
    
    var event_time = NSArray()
    var event_title = NSArray()
    
    var event_type_name = NSArray()
    @IBAction func close(_ sender: Any) {
        
    }
    @IBAction func tick(_ sender: Any) {
        
        
    }
    @IBOutlet weak var time_text: UILabel!
    @IBOutlet weak var date_text: UILabel!
    @IBOutlet weak var venue_text: UILabel!
    @IBOutlet weak var details_text: UILabel!
    @IBOutlet weak var tittle_text: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        eventsingle.delegate=self
        attendparsor.delegate=self
        print("eventids",eventids)
        
        self.view.layer.shouldRasterize = true;
        self.view.layer.rasterizationScale = UIScreen.main.scale;
        let user_id=UserDefaults.standard.string(forKey: "user_id")
        print("user_id",user_id)
        
        var eventid=eventids
        eventsingle.eventCheck(userid: user_id!, Event_id: eventids)

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
    
    func eventSingleResponceLister(response: NSDictionary) {
        print("responce",response)
        
        eventsinfo=response.value(forKey: "events_info") as! NSArray
        eventlist=eventsinfo.value(forKey: "event_list") as! NSObject
        datearray=eventsinfo.value(forKey: "date") as! NSArray
        
        
        Event_id = eventlist.value(forKey: "Event_id") as! NSArray
        
        print("eventlist",eventlist)
        
        event_description = eventlist.value(forKey: "event_description") as! NSArray
        event_icon = eventlist.value(forKey: "event_icon") as! NSArray
        event_time = eventlist.value(forKey: "event_time") as! NSArray
        event_title = eventlist.value(forKey: "event_title") as! NSArray
        event_type_name = eventlist.value(forKey: "event_type_name") as! NSArray
         event_venue = eventlist.value(forKey: "event_venue") as! NSArray
        
        var eventlist_string=eventlist.value(forKey: "eventlist");
        
        if(datearray.count>0){
        var  eventdate=datearray[0]
        
        
        var eventid=NSArray()
            var event_times=NSArray()
        var event_titles=NSArray()
        var event_type_namearrya=NSArray()
        
        var imagearray=NSArray()
            var details=NSArray()
             var evcent_venyue=NSArray()
        event_times=event_time[0]as! NSArray
        eventid=Event_id[0]as! NSArray
        event_titles=event_title[0]as! NSArray
        event_type_namearrya=event_type_name[0] as! NSArray
        imagearray=event_icon[0] as! NSArray
        
        evcent_venyue=event_venue[0]as! NSArray
        details=event_description[0]as! NSArray
        
        var descri=details[0]as! String
        var event_tittle=event_titles[0]as! String
        
          var evcent_venyues=evcent_venyue[0]as! String
        var event_type=event_type_namearrya[0]as! String
        
        var event_tim=event_times[0]as! String
        
        var Image_Url=imagearray[0]as! String
        self.tittle_text.text=event_type
        self.venue_text.text=evcent_venyues as? String
        self.date_text.text=eventdate as? String
        self.details_text.text=descri as? String
              self.time_text.text=event_tim as? String
        
        
        
        
        self.image_view.sd_setImage(with: URL(string: Image_Url as! String), placeholderImage: UIImage(named: "avatar"))
        }
    }
    
    
    
    func AttendOrDecly(yesorno: String) {
        
        
        let user_id=UserDefaults.standard.string(forKey: "user_id")
        print("user_id",user_id)

        var eventid=eventids
        
        attendparsor.AttendEvent(event_id: eventid, userId: user_id!, attendVal: yesorno)
        
        
    }
    
    func attendResponceLister(response: NSDictionary) {
     print(response)
        cancelProgress()
        if(response.value(forKey:"error") as! Bool?)!
        {
            
        }
        else{
       
            var messgae=response.value(forKey: "message") as! String
            
            let title = "Success"
        
            let image = UIImage(named: "whatsappgray")
            
            // Create the dialog
            let popup = PopupDialog(title: title, message: messgae)
            
            // Create buttons
            let buttonOne = CancelButton(title: "OK") {
                print("You canceled the car dialog.")
            }
            
            
            popup.addButtons([buttonOne])
            
            // Present dialog
            self.present(popup, animated: true, completion: nil)
            

            
            
            
        }
        
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
