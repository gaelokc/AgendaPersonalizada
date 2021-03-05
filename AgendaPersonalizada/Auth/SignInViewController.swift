//
//  SignInViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 05/03/2021.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    @IBAction func signInButtonTap(_ sender: Any) {
        self.performSegue(withIdentifier: "userSignedInSegue", sender: nil)    }
    
}
