//
//  ViewController.swift
//  Email Validation
//
//  Created by Gustavo on 1/13/19.
//  Copyright © 2019 Inexo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var txtResult: UITextView!
    
    let VALID_EMAIL = "ejemplo@dominio.com"
    let VALID_PASS = "12345"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Login(_ sender: Any) {
        let email = txtEmail.text ?? ""
        let clave = txtClave.text ?? ""
        print("Procesar > email(\(email)) clave(\(clave))")
        
        let user =  Usuario()
        user.email = email
        user.clave = clave
        
        procesar(user: user)
    }
    
    
    //func procesar(email:String, clave:String){
    func procesar(user: Usuario){
        var msj = "Su Usuario o Clave no coinciden"
        
        if !user.isValidEmail() {
            msj = "El email no es valido . Vuelva a ingresar su email"
        }else if user.email == VALID_EMAIL && user.clave == VALID_PASS {
            msj = "Gracias por ingresar al sistema con el correo \(user.email!)"
            
            //            imgFoto.image = UIImage(named: "perro1")

            imgFoto.image = UIImage(named: "user photo")
        }
        txtResult.text = msj
        
        
    }
    
    @IBAction func reset(_ sender: Any) {
        
        imgFoto.image = UIImage(named: "usergeneral")
        txtResult.text = ""
        txtEmail.text = ""
        txtClave.text = ""
        
        
    }
}



class Usuario {
    var email: String?
    var clave: String?
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.email)
    }

}
