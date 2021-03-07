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
    //funciones creadas para la app
    
    private let database = Database.database().reference()

    static func signUpUser(email: String, password: String, name: String, onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        //Funcion de creacion de usuarios con email y contraseña
            let auth = Auth.auth()
            
            auth.createUser(withEmail: email, password: password) { (authResult, error) in
                if error != nil {
                    onError(error!)
                }
                //Es necesario llamar a otra funcion de actualización de la base de datos de usuarios
                uploadToDatabase(email: email, name: name, onSuccess: onSuccess)
            }
        }
    
    static func removeUser(completion: @escaping (Error?) -> Void){
        //Funcion de eliminación de usuario de la base de datos
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
        //Funcion de Actualizacion de la base de datos donde guarda nombre y email
            let ref = Database.database().reference()
            let uid = Auth.auth().currentUser?.uid
            
            ref.child("users").child(uid!).setValue(["email" : email, "name" : name])
            onSuccess()
        }
    
    static func getUserInfo(onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        //Funcion de obtencion de la informacion de la base de datos que luego se usa para mostrar el nombre del usuario en la página de perfil
        let ref = Database.database().reference()
        let defaults = UserDefaults.standard
        
        //Obtencion del usuario actual
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Usuario no encontrado")
            return
        }
        
        //Datos del usuario
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
        //Sencillo control de alertas personalizadas
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
            
        return alert
            
    }
    
    static func addContact(name: String, number: String, onSuccess: @escaping () -> Void){
        //Funcion de Actualización de la base de datos para los contactos
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid

        ref.child("contacts").child(uid!).setValue(["name" : name, "number" : number])
        onSuccess()
        
    }
}
