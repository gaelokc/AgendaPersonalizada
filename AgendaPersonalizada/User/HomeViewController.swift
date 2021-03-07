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
    
    @IBOutlet weak var contactsButton: UIButton!
    @IBOutlet weak var changePassButton: UIButton!
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    @IBOutlet weak var logOutB: UIButton!
    @IBOutlet weak var deleteAccountButton: UIButton!
    
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

        //Esta es la funcion de cerrar sesión que a demás impide que al iniciar la aplicación el usuario aparezca en la página de perfil
        do {
            try auth.signOut()
            
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isUserSignedIn")
            self.dismiss(animated: true, completion: nil)
            
        } catch let signOutError {
            self.present(Service.createAlertController(title: "Error", message: signOutError.localizedDescription), animated: true, completion: nil)
        }
        
    }
    @IBAction func contactsButtonTap(_ sender: Any) {
        //Lleva al usuario a la página de la lista de contactos
        self.performSegue(withIdentifier: "contactsSegue", sender: nil)
        
    }
    
    @IBAction func changePassButtonTap(_ sender: Any) {
        //Devuelve al usuario a la página de Reestablecimiento de contraseña
        self.performSegue(withIdentifier: "changePassSegue", sender: nil)
        
    }
    
    @IBAction func deleteAccountButtonTap(_ sender: Any) {
        _ = UserDefaults.standard
        let auth = Auth.auth()

        Service.removeUser { (_: Error?) in
            //Ejecuta la funcion service de borrado de la cuenta
        }
        
        //A demás he implementado la misma funcion de cerrar sesión
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
