//
//  Service.swift
//  AgendaPersonalizada
//
//  Created by user176704 on 05/03/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class Service {
    
    private let database = Database.database().reference()

    static func signUpUser(email: String, password: String, name: String, onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
            let auth = Auth.auth()
            
            auth.createUser(withEmail: email, password: password) { (authResult, error) in
                if error != nil {
                    onError(error!)
                }
                
                uploadToDatabase(email: email, name: name, onSuccess: onSuccess)
            }
        }
    
    static func removeUser(completion: @escaping (Error?) -> Void){
        guard let uid = Auth.auth().currentUser else {return}
        
        uid.delete {error in
            if let error = error {
                //Ha ocurrido un error
            } else {
                //La cuenta se elimina
                print("\(#function): -> Cuenta eliminada")
            }
            
        }
    }
    
    static func uploadToDatabase(email: String, name: String, onSuccess: @escaping () -> Void) {
            let ref = Database.database().reference()
            let uid = Auth.auth().currentUser?.uid
            
            ref.child("users").child(uid!).setValue(["email" : email, "name" : name])
            onSuccess()
        }
    
    static func getUserInfo(onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        let ref = Database.database().reference()
        let defaults = UserDefaults.standard
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Usuario no encontrado")
            return
        }
        
        ref.child("users").child(uid).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : Any] {
                let email = dictionary["email"] as! String
                let name = dictionary["name"] as! String
                
                defaults.set(email, forKey: "userEmailKey")
                defaults.set(name, forKey: "userNameKey")
                
                onSuccess()
            }
        }) { (error) in
            onError (error)
        }
    }
    
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
            
        return alert
            
    }
    
    static func addContact(name: String, number: String, onSuccess: @escaping () -> Void){
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid

        ref.child("contacts").child(uid!).setValue(["name" : name, "number" : number])
        onSuccess()
        
    }
}
