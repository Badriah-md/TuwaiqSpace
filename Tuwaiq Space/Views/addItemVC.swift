//
//  addItemVC.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 22/09/1442 AH.
//

import UIKit
import FirebaseFirestore
import Firebase
import BSImagePicker
import Photos

class addItemVC: UIViewController {

    @IBOutlet weak var imagePicker: UIImageView!
    @IBOutlet weak var projectName: UITextField!
    @IBOutlet weak var projectDescription: UITextView!
    @IBOutlet weak var projectLink: UITextField!
    var Images : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var title = projectName.text
        var description = projectDescription.text
        var link = projectLink.text
        let postDictionary = ["title": title,"description":description,"link":link]
        let db = Firestore.firestore()
        let newDocument = db.collection("posts").document()
        newDocument.setData(postDictionary as [String : Any])
        
        
        // Do any additional setup after loading the view.
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        imagePicker.isUserInteractionEnabled = true
        imagePicker.addGestureRecognizer(imageTap)
        
        imagePick = UIImagePickerController()
        imagePick.allowsEditing = true
        imagePick.sourceType = .photoLibrary
        imagePick.delegate = self
    }
    var imagePick :UIImagePickerController!
    @objc func openImagePicker(){
        self.present(imagePick, animated: true, completion: nil)
        
    }
    
    
  
    @IBAction func addImageBtn(_ sender: Any) {
       let BSVC = ImagePickerController()
       
        
        presentImagePicker(BSVC, animated: true, select: { (PhAssets : PHAsset) in
                  
                  
              }, deselect: { (PhAssets : PHAsset ) in
                  
              }, cancel: { (PhAssets : [PHAsset] ) in
                  
              }, finish: { (PhAssets : [PHAsset]) in
                  if PhAssets.count > 0 {
                  let img = PhAssets[0]
                      self.imagePicker.image = getUIImage(asset: img)
                   
                  }
                  
              }, completion: nil)
        
    }
    func UploadManyImages(completion : @escaping (_ URLs : [String])->()){
        var UploadedImages : [String] = []
        for one in self.Images {
            one.Upload { (url) in
                UploadedImages.append(url)
                if self.Images.count == UploadedImages.count {
                    completion(UploadedImages)
                }
            }
        }
    }
    
    @IBAction func addItemBtn(_ sender: Any) {
        services.uploadToFirebase(desc: projectDescription.text, title: projectName.text!, urlLink: projectDescription.text) {
            print("success")
           
        }
    }
    func uploadItemImage(_ image:UIImage,completion: @escaping((_ url:String?)->())){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let storageRef = Storage.storage().reference().child("user/images\(uid)")
        guard let imageData = image.jpegData(compressionQuality: 0.75)  else{return}
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        var a = storageRef.putData(imageData, metadata: metaData) { (metaData, error) in
            if error == nil ,metaData != nil{
                print("success")
            }
            
            }
        }
        
    
    
  

}
extension addItemVC:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.imagePicker.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

func getUIImage(asset: PHAsset) -> UIImage? {
    var img: UIImage?
    let manager = PHImageManager.default()
    let options = PHImageRequestOptions()
    options.version = .original
    options.isSynchronous = true
    manager.requestImageDataAndOrientation(for: asset, options: options) { (data, _, _, _) in
        if let data = data {
            img = UIImage(data: data)
        }
    }
    return img
}
