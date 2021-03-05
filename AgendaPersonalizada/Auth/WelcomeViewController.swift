//
//  WelcomeViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 05/03/2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    @IBAction func signInButtonTap(_ sender: Any) {
        self.performSegue(withIdentifier: "signInSegue", sender: nil)
    }
    
    @IBAction func signUpButtonTap(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
}
