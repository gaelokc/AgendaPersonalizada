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

        Service.addContact(name: nameField.text!, number: numberField.text!) {
            self.performSegue(withIdentifier: "returnAddSegue", sender: nil)
            
        }
    }
}
