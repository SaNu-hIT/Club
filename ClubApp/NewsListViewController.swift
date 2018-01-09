//
//  NewsListViewController.swift
//  ClubApp
//
//  Created by intellye labs on 09/08/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import SwiftyJSON
import SVProgressHUD
class NewsListViewController: UIViewController,NewsRespo,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var news_tableview: UITableView!
    var newsparsor: NewsPaser = NewsPaser()
    
    var tittlearray = NSArray()
    var descriptions = NSArray()
    var news_list=NSArray()
    var News_Image=NSObject()
    
    

    
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

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func OnBackClicked(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "news_details_cell",for : indexPath) as! NewsViewTableViewCell
        cell.tittle_text.text=tittlearray[indexPath.row] as! String
        cell.description_text.text=descriptions[indexPath.row] as! String
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        
    }
    
    
    func newsrserespo(response: NSDictionary) {
        cancelProgress()
        if(response.value(forKey:"error") as! Bool?)!
        {
        }
        else{
            news_list=response.value(forKey: "news_list") as! NSArray
            
            tittlearray = news_list.value(forKey: "title") as! NSArray
            
            news_id = news_list.value(forKey: "news_id") as! NSArray
            
            descriptions = news_list.value(forKey: "description") as! NSArray
            
            News_Image = news_list.value(forKey: "News_Image") as! NSObject
            
            print("News_Image",News_Image)
            
            
            let json = JSON(response)

            
        }
        news_tableview.reloadData()
        
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

