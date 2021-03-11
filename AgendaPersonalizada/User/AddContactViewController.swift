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
    
    var contactsName = [String]()
    var contactsNumber = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addButtonTap(_ sender: Any){
        
        //inserta en el array los campos introducidos en el text field
        contactsName.insert(nameField.text!, at: 1)
        contactsNumber.insert(numberField.text!, at: 1)
        
        //Al pulsar el ususario vuelve a la página de lista de contactos
        self.performSegue(withIdentifier: "returnAddSegue", sender: nil)
            
    }
}
