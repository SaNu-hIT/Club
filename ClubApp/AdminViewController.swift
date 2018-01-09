//
//  AdminViewController.swift
//  ClubApp
//
//  Created by intellye labs on 21/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
      var data = ["Add event","Add News","View Event Details","View News","Add Photos","Contact Developer"]
    var image=["",]

    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate=self
        collectionview.dataSource=self
print("indexPath")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func onBackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
  

    
    
    

    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewcell", for: indexPath as IndexPath) as! AdminCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        cell.text_view.text=self.data[indexPath.row]



        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        
        
print("indexPath",indexPath)
        var row = indexPath.row
        
        print("row",row)
        if(row==0)
                    {
                        print("Add event")
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil);
                        let vc = storyboard.instantiateViewController(withIdentifier:"add_event"); // MySecondSecreen the storyboard ID
                        self.present(vc, animated: true, completion: nil)
                        
                    }
                    else if(row==1)
                    {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil);
                        let vc = storyboard.instantiateViewController(withIdentifier:"add_news"); // MySecondSecreen the storyboard ID
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if(row==2)
                    {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil);
                        let vc = storyboard.instantiateViewController(withIdentifier:"event_details"); // MySecondSecreen the storyboard ID
                        
                        self.present(vc, animated: true, completion: nil)
                        
                            print("View Event details")
                    }
                    else if(row==3)
                    {
            print("View Event news")
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil);
                        let vc = storyboard.instantiateViewController(withIdentifier:"news_view_viewcontroller"); // MySecondSecreen the storyboard ID
                        self.present(vc, animated: true, completion: nil)
                        
                    }
                    else if(row==4)
                    {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil);
                        let vc = storyboard.instantiateViewController(withIdentifier:"add_photo"); // MySecondSecreen the storyboard ID
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if(row==5)
                    {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil);
                        let vc = storyboard.instantiateViewController(withIdentifier:"event_details"); // MySecondSecreen the storyboard ID
                        self.present(vc, animated: true, completion: nil)
                           print("contact devoloper")
                        
                    }
 
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionview.frame.width / 2 - 1
        
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
   

}
