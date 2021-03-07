//
//  AddContactViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 07/03/2021.
//

import UIKit
import Firebase

class AddContactViewController: UIViewController {
    private let database = Database.database().reference()

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func addButtonTap(_ sender: Any){

        //Accede a la funcion de creación de contactos de Service
        Service.addContact(name: nameField.text!, number: numberField.text!) {
            //Al pulsar el ususario vuelve a la página de lista de contactos
            self.performSegue(withIdentifier: "returnAddSegue", sender: nil)
            
        }
    }
}
