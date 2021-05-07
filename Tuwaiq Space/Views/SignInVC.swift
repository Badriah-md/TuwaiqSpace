//
//  SignInVC.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 21/09/1442 AH.
//

import UIKit
import Firebase
class SignInVC: UIViewController {

    @IBOutlet weak var EmailSignInTxt: UITextField!
    @IBOutlet weak var passwordSignInTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInBtn(_ sender: Any) {
        if let email = EmailSignInTxt.text,let password = passwordSignInTxt.text{
            
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let e = error{
                let err = e.localizedDescription
                let alert = UIAlertController(title: "تنبيه", message: "\(err)", preferredStyle: .alert)
                let action = UIAlertAction(title: "تم", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }else{
                self.performSegue(withIdentifier: "signIn", sender: self)
            }
        }
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
