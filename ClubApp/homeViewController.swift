//
//  homeViewController.swift
//  ClubApp
//
//  Created by ArunMadav on 7/24/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import SVProgressHUD
import SwiftyJSON

class homeViewController: UIViewController,NewsRespo,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var news_tableview: UITableView!
    var newsparsor: NewsPaser = NewsPaser()
    
    var tittlearray = NSArray()
     var descriptions = NSArray()
    var news_list=NSArray()
    var News_Image=NSObject()
    
    
    @IBAction func sideButtonClicked(_ sender: Any) {
        
        print("open side menu")
        sideMenuViewController?._presentLeftMenuViewController()
        
    }
    
  var news_id = NSArray()

    let streets = ["Albemarle", "Brandywine", "Chesapeake"]
    override func viewDidLoad() {
        super.viewDidLoad()
        news_tableview.delegate=self
        news_tableview.dataSource=self
        
        newsparsor.delegate=self
           ShowProgress()
      newsparsor.NewsResponce()
     
       news_tableview.reloadData()
        
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
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "news_cell",for : indexPath) as! NewsTableViewCell
        cell.title.text=tittlearray[indexPath.row] as! String
        cell.description_text.text=descriptions[indexPath.row] as! String
//        var Image_Url=News_Image.value(forKey: "news_imageurl") as! String
//        cell.image_view.sd_setImage(with: URL(string: "https://cdn.vox-cdn.com/thumbor/SeEQ3YjZFLi7nlyuwJc5yAVHtcw=/109x0:3889x2835/1200x800/filters:focal(109x0:3889x2835)/cdn.vox-cdn.com/uploads/chorus_image/image/45831192/bonobos-atlanta-guide-shop.0.0.jpg"), placeholderImage: UIImage(named: "avatar"))
//        cell.image_view.image=placeholder.
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        
    }

    
    func newsrserespo(response: NSDictionary) {
        cancelProgress()
        if(response.value(forKey:"error") as! Bool?)!
        {
            
          
            print("error is true")
            
            
        }
        else{
            news_list=response.value(forKey: "news_list") as! NSArray
            
            tittlearray = news_list.value(forKey: "title") as! NSArray
            
            news_id = news_list.value(forKey: "news_id") as! NSArray
            
            descriptions = news_list.value(forKey: "description") as! NSArray
            
                 News_Image = news_list.value(forKey: "News_Image") as! NSObject
            
print("News_Image",News_Image)
            
            
            let json = JSON(response)
            print("JSON",json)
            
        }
        news_tableview.reloadData()

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
