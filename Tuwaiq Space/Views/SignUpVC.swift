//
//  ViewController.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 21/09/1442 AH.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var EmailRegistrationTxt: UITextField!
    
    @IBOutlet weak var PassowrdRegistrationTxt: UITextField!
    @IBOutlet weak var RePasswordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func registerBtn(_ sender: Any) {
        if(PassowrdRegistrationTxt.text == RePasswordTxt.text){
            
        
        if let email = EmailRegistrationTxt.text,let password = PassowrdRegistrationTxt.text{
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let e = error{
                    let err = e.localizedDescription
                    let alert = UIAlertController(title: "تنبيه", message: "\(err)", preferredStyle: .alert)
                    let action = UIAlertAction(title: "تم", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                    self.performSegue(withIdentifier: "signUp", sender: self)
                }
            }
        }
        }else{
            let alert = UIAlertController(title: "تنبيه", message: "كلمات المرور غير متطابقه", preferredStyle: .alert)
            let action = UIAlertAction(title: "تم", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

//design part//
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
@IBDesignable extension UITextField {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
