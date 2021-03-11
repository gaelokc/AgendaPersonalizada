//
//  contactsViewController.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 11/03/2021.
//

import UIKit

class contactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Estas funciones definen la forma y rellenan el Table View
    /*func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Utiliza los valores de un array llamado contacts
        return contacts.count
        //return contactArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //Utiliza los valores de un array llamado contacts
        cell.textLabel?.text = contacts[indexPath.row]
        //cell.textLabel?.text = contactArray[indexPath.section]
        //cell.textLabel?.text = contactArrayNumber[indexPath.section]
        
        return cell
    }
    
    //Inicialización de variables
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var modifyButton: UIButton!
    
    //El array que rellena la lista
    var contactArray = [String]()
    var contactArrayNumber = [String]()
    
    //Array de testeo
    var contacts = [
        "Contacto 66548935",
        "Patata 118462233",
        "Cabeza 605978125"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Recoge la información del array del otro view controller
    func assignArray(){
        let addViewController = AddContactViewController()
        contactArray = addViewController.contactsName
        contactArrayNumber = addViewController.contactsNumber
    }
    
    @IBAction func addButtonTap(_ sender: Any) {
        //self.performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    @IBAction func removeButtonTap(_ sender: Any) {
        //Esta función borra los contactos en orden que se han introducido del más antiguo al ás reciente
        contacts.remove(at: 0)
        //contactName.remove(at: 0)
        //contactNumber.remove(at: 0)
        let indexPath = IndexPath(item: 0, section: 0)
        listTableView.deleteRows(at: [indexPath], with: .fade)
    }
    
}
