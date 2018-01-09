//
//  AddNewsViewController.swift
//  ClubApp
//
//  Created by intellye labs on 27/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit
import Photos
import NohanaImagePicker
import SVProgressHUD
class AddNewsViewController: UIViewController {
    var addnewsparsor : AddNewsParsor = AddNewsParsor()
    static var imgArray = [UIImage]()
    static var imgCount = Int()
    
    var imagearray = [String]()
   

     let picker = NohanaImagePickerController()
    @IBOutlet weak var image_collection: UICollectionView!
    @IBAction func SaveNews(_ sender: Any) {
    }
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addNews(_ sender: Any) {
        
        
        
        
        ShowProgress()
        
        for i in 0..<AddNewsViewController.imgArray.count
        {
            
            let strings = AddNewsViewController.imgArray[i];
            print("strings",strings)
            
            let imageData: Data =  UIImagePNGRepresentation(strings)!
            let base64String = imageData.base64EncodedString()
            
            imagearray.append(base64String)
            print("count",imagearray.count)
            
            
            
            
            
            
        }

        let date = Date()
        let formatter = DateFormatter()
       
        
        formatter.dateFormat = "dd-MM-yyyy"
   
        let result = formatter.string(from: date)
        
        print("date",result)
        
   addnewsparsor.Addnews(image: imagearray, caption: tittle_text.text!, description: description_text.text!, dates: result)
        
        
    }
   
    @IBAction func openCamara(_ sender: Any) {
        
        
        openCamara()
        
    }
    @IBOutlet weak var description_text: UITextField!
    @IBOutlet weak var tittle_text: UITextField!
    @IBAction func baclClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         self.picker.delegate = self
        self.image_collection.delegate=self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func openCamara() {
        
        present(self.picker, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddNewsViewController: NohanaImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func nohanaImagePickerDidCancel(_ picker: NohanaImagePickerController) {
        print("🐷Canceled🙅")
        picker.dismiss(animated: true, completion: nil)
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, didFinishPickingPhotoKitAssets pickedAssts :[PHAsset]) {
        print("🐷Completed🙆\n\tpickedAssets = \(pickedAssts)")
        
        picker.dismiss(animated: true, completion: nil)
        
        
        
        let numberOfImages = pickedAssts.count
        print("\(numberOfImages)")
        
        
        AddNewsViewController.imgCount = pickedAssts.count
        
        var phAssetArray : [PHAsset] = []
        
        for i in 0..<pickedAssts.count
        {
            AddNewsViewController
                .imgArray.append(self.getAssetThumbnail(asset: pickedAssts[i]));
        }
        let size = CGSize(width: 50, height: 50)
        let options = PHImageRequestOptions()
        
        let manager : PHCachingImageManager =  PHCachingImageManager()
        
        
        manager.startCachingImages(for: phAssetArray,
                                   targetSize: size,
                                   contentMode: .aspectFill,
                                   options: options)
        
        image_collection.reloadData()
    }
    
    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.version = .original
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in thumbnail = result! })
        return thumbnail
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AddNewsViewController.imgArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_main", for: indexPath) as! NewsCollectionViewCell
        
        print(AddNewsViewController.imgArray.count)
        print(indexPath.row)
        print(AddNewsViewController.imgArray[indexPath.row])
        
        cell.image_views.image = AddNewsViewController.imgArray[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = image_collection.frame.width / 3 - 2
        
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func AddPhotoResponceLister(response: NSDictionary) {
        print(response)
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

