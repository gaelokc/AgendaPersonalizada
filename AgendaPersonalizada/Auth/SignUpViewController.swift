//
//  SignUpViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 05/03/2021.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rePasswordField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signUpButtonTap(_ sender: Any) {
        let defaults = UserDefaults.standard
        
                
        Service.signUpUser(email: emailField.text!, password: passwordField.text!, name: nameField.text!, onSuccess: {
            defaults.set(true, forKey: "isUserSignedIn")
            self.performSegue(withIdentifier: "userSignedUpSegue", sender: nil)
            
        }) { (error) in
            self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
        }
        
    }
    
}
