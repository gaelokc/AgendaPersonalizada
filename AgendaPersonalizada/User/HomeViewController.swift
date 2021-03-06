//
//  HomeViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 05/03/2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    @IBOutlet weak var logOutB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        Service.getUserInfo(onSuccess: {
            self.welcomeLabel.text = "Bienvenido \(defaults.string(forKey: "userNameKey")!)"
        }) { (error) in
            self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
        }
    }
    
    @IBAction func logOutButtonTap(_ sender: Any) {}
    
    @IBAction func logOutBTap(_ sender: Any) {
        let auth = Auth.auth()

        do {
            try auth.signOut()
            
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isUserSignedIn")
            self.dismiss(animated: true, completion: nil)
            
        } catch let signOutError {
            self.present(Service.createAlertController(title: "Error", message: signOutError.localizedDescription), animated: true, completion: nil)
        }
        
    }
    
}
