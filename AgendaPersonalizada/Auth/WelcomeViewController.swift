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
        
        let defaults = UserDefaults.standard
        
        if defaults.bool(forKey: "isUserSignedIn"){
            let viewController = self.storyboard?.instantiateViewController(identifier: "welcomeViewID") as! UINavigationController
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .overFullScreen
            self.present(viewController, animated: true, completion: nil)
        }

    }
 
    @IBAction func signInButtonTap(_ sender: Any) {
        self.performSegue(withIdentifier: "signInSegue", sender: nil)
    }
    
    @IBAction func signUpButtonTap(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
}
