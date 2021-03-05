//
//  SignUpViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 05/03/2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signUpButtonTap(_ sender: Any) {
        self.performSegue(withIdentifier: "userSignedUpSegue", sender: nil)
    }
    
}
