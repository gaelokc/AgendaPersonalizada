//
//  WelcomeViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 05/03/2021.
//

import UIKit

//Esta es la página principal, la que se verá antes de iniciar sesión o después de cerrarla
class WelcomeViewController: UIViewController {

    //la vista consiste únicamente en dos botones para entrar o registrarse
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Comprobar si el usuario ha iniciado ya sesión para mandarle directamente a su perfil
        let defaults = UserDefaults.standard
        
        if defaults.bool(forKey: "isUserSignedIn"){
            let viewController = self.storyboard?.instantiateViewController(identifier: "welcomeViewID") as! UINavigationController
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .overFullScreen
            self.present(viewController, animated: true, completion: nil)
        }

    }
 
    @IBAction func signInButtonTap(_ sender: Any) {
        //Acceder a la página de Entrar
        self.performSegue(withIdentifier: "signInSegue", sender: nil)
    }
    
    @IBAction func signUpButtonTap(_ sender: Any) {
        //Acceder a la página de Registro
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
}
