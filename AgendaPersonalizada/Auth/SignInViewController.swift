//
//  SignInViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 05/03/2021.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    //Inicialización de los campos de texto y los botones
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPassButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    @IBAction func signInButtonTap(_ sender: Any) {
        //Pulsar el boton de entrar compruba que el email y la contraseña sean válidos y si coinciden con los de la base de datos ingresa con el usuario escogido
        let auth = Auth.auth()
        
        let defaults = UserDefaults.standard
        
        auth.signIn(withEmail: emailField.text!, password: passwordField.text!) { (authResult, error) in
            if error != nil {
                self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
                
                return
            }
            //Marca que el usuario se a logueado para que la proxima vez que se abra la app acceda directamente al perfil
            defaults.setValue(true, forKey: "isUserSignedIn")
            //LLeva al usuario a la página de perfil
            self.performSegue(withIdentifier: "userSignedInSegue", sender: nil)
            
        }
        
    }
    
    @IBAction func forgotPassButtonTap(_ sender: Any) {
        //Lleva al usuario a la página de recuparación de contraseña
        self.performSegue(withIdentifier: "forgotPassSegue", sender: nil)
        
    }
}
