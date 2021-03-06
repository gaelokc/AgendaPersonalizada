//
//  SignInViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 05/03/2021.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPassButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    @IBAction func signInButtonTap(_ sender: Any) {
        
        let auth = Auth.auth()
        
        let defaults = UserDefaults.standard
        
        auth.signIn(withEmail: emailField.text!, password: passwordField.text!) { (authResult, error) in
            if error != nil {
                self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
                
                return
            }
            
            defaults.setValue(true, forKey: "isUserSignedIn")
            
            self.performSegue(withIdentifier: "userSignedInSegue", sender: nil)
            
        }
        
    }
    
    @IBAction func forgotPassButtonTap(_ sender: Any) {
        self.performSegue(withIdentifier: "forgotPassSegue", sender: nil)
        
    }
}
