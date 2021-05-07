//
//  services.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 22/09/1442 AH.
//

import Foundation
import Firebase

class services {
    static func uploadToFirebase(desc:String,title:String,urlLink:String ,onSuccess:@escaping ()->Void){
       let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        
        ref.child("users\(Int.random(in: 0..<100))").child(uid!).setValue(["description":desc,"title":title,"urlLink":urlLink])
        onSuccess()
    }
    static func getPostInfo(onSuccess:@escaping ()->Void,onError:@escaping ()->(_ error:Error?)-> Void){
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else {
            print("item not found")
            return
        }
        ref.child("users").child(uid).observe(.value) { (snapchot) in
            if let dictionary = snapchot.value as? [String:Any]{
            let desc = dictionary["desc"] as! String
            let title = dictionary["title"] as! String
            let urlLink = dictionary["urlLink"] as! String
            
                onSuccess()
            } 
        }
        
    }
}
