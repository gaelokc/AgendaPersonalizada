//
//  ForgotPassViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 06/03/2021.
//

import UIKit
import Firebase

class ForgotPassViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgotPassButtonTap(_ sender: Any) {
        //Pulsar el botón llama a la función Service de envio de email de reseteo de contraseña
        let auth = Auth.auth()
                
        auth.sendPasswordReset(withEmail: emailField.text!) { (error) in
            if let error = error {
                //Control de errores
                let alert = Service.createAlertController(title: "Error", message: error.localizedDescription)
                self.present(alert, animated: true, completion: nil)
                return
            }
                    
            //Muestra un mensaje para informar de que el correo ha sido enviado
            let alert = Service.createAlertController(title: "Perfecto", message: "El correo de reestablecimiento ha sido enviado!")
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
