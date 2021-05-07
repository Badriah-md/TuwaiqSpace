//
//  PostObject.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 25/09/1442 AH.
//

//


import UIKit
import Firebase

class PostObject {
    
    var ID : String?
    var Stamp : TimeInterval?
    
    var Name : String?
    var Description : String?
    
    
    
    var ImageURLs : [String]?
    
    init(ID : String, Stamp : TimeInterval, Name : String, Description : String,  ImageURLs : [String]) {
        self.ID = ID
        self.Stamp = Stamp
        self.Name = Name
        self.Description = Description
        self.ImageURLs = ImageURLs
    }
    
    init(Dictionary : [String : AnyObject]) {
        self.ID = Dictionary["ID"] as? String
        self.Stamp = Dictionary["Stamp"] as? TimeInterval
        self.Name = Dictionary["Name"] as? String
        self.Description = Dictionary["Description"] as? String
        self.ImageURLs = Dictionary["ImageURLs"] as? [String]
        
    }
    
    func MakeDictionary()->[String : AnyObject] {
        var D : [String : AnyObject] = [:]
        D["ID"] = self.ID as AnyObject
        D["Stamp"] = self.Stamp as AnyObject
        D["Name"] = self.Name as AnyObject
        D["Description"] = self.Description as AnyObject
        D["ImageURLs"] = self.ImageURLs as AnyObject
        return D
    }
    
    func Upload(){
        guard let id = self.ID else { return }
        Firestore.firestore().collection("Posts").document(id).setData(MakeDictionary())
    }
    
    func Remove(){
        guard let id = self.ID else { return }
        Firestore.firestore().collection("Posts").document(id).delete()
    }
    
    
}


class ProductApi {

    static func GetProduct(ID : String, completion : @escaping (_ Product : PostObject)->()){
        Firestore.firestore().collection("Posts").document(ID).addSnapshotListener { (Snapshot : DocumentSnapshot?, Error : Error?) in
            if let data = Snapshot?.data() as [String : AnyObject]? {
                let New = PostObject(Dictionary: data)
                completion(New)
            }
        }
    }
    
    static func GetAllPosts(completion : @escaping (_ Product : PostObject)->()){
        Firestore.firestore().collection("Posts").getDocuments { (Snapshot, error) in
            if error != nil { print("Error") ; return }
            guard let documents = Snapshot?.documents else { return }
            for P in documents {
                if let data = P.data() as [String : AnyObject]? {
                    let New = PostObject(Dictionary: data)
                    completion(New)
                }
            }
        }

    }
    
}

