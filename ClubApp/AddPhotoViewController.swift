
import UIKit
import Photos
import NohanaImagePicker
import SVProgressHUD
class AddPhotoViewController: UIViewController,AddPhotoRespo {
    var addphoto : AddPhotoParsor = AddPhotoParsor()
    
    @IBOutlet weak var caption: UITextField!
    @IBOutlet weak var collection_view: UICollectionView!
    static var imgArray = [UIImage]()
    static var imgCount = Int()
  
    var imagearray = [String]()
  
 let picker = NohanaImagePickerController()
 
    @IBAction func saveDataToServer(_ sender: Any) {
        
        ShowProgress()
        
        for i in 0..<AddPhotoViewController.imgArray.count
        {
            
            let strings = AddPhotoViewController.imgArray[i];
            print("strings",strings)

            let imageData:Data =  UIImagePNGRepresentation(strings)!
            let base64String = imageData.base64EncodedString()
            
            imagearray.append(base64String)
            print("count",imagearray.count)
            
            
            
            
            
            
        }
        addphoto.AddPhoto(image: imagearray, caption: caption.text!)
        
        
        
      
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 self.picker.delegate = self
       self.addphoto.delegate=self
        // Do any additional setup after loading the view.
    }
   
    @IBAction func backClick(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var caption_text: UITextField!
    
    @IBAction func addimage(_ sender: Any) {
        openCamara()
        
        
        
    }
    @IBAction func saveData(_ sender: Any) {
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
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

extension AddPhotoViewController: NohanaImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func nohanaImagePickerDidCancel(_ picker: NohanaImagePickerController) {
        print("🐷Canceled🙅")
        picker.dismiss(animated: true, completion: nil)
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, didFinishPickingPhotoKitAssets pickedAssts :[PHAsset]) {
        print("🐷Completed🙆\n\tpickedAssets = \(pickedAssts)")
        
        picker.dismiss(animated: true, completion: nil)
        
        
        
        let numberOfImages = pickedAssts.count
        print("\(numberOfImages)")
        
        
        AddPhotoViewController.imgCount = pickedAssts.count
        
        var phAssetArray : [PHAsset] = []
        
        for i in 0..<pickedAssts.count
        {
            AddPhotoViewController
.imgArray.append(self.getAssetThumbnail(asset: pickedAssts[i]));
        }
        let size = CGSize(width: 50, height: 50)
        let options = PHImageRequestOptions()
        
        let manager : PHCachingImageManager =  PHCachingImageManager()
        
        
        manager.startCachingImages(for: phAssetArray,
                                   targetSize: size,
                                   contentMode: .aspectFill,
                                   options: options)
        
        collection_view.reloadData()
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
        return AddPhotoViewController.imgArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_image", for: indexPath) as! AddimgeCollectionViewCell
        
        print(AddPhotoViewController.imgArray.count)
        print(indexPath.row)
        print(AddPhotoViewController.imgArray[indexPath.row])
        
    cell.imageview.image =  AddPhotoViewController.imgArray[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collection_view.frame.width / 3 - 2
        
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
