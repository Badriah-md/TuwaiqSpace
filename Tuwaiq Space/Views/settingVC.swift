//
//  settingVCViewController.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 22/09/1442 AH.
//

import UIKit
import Firebase

class settingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutBtn(_ sender: Any) {
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
        dismiss(animated: true, completion: nil)
       } catch let signOutError as NSError {
         print ("Error signing out: %@", signOutError)
       }
         
        
    }
    
}
