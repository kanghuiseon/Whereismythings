//
//  SignUpViewController.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/15.
//

import UIKit



class SignUpViewController: UIViewController {

    var loginData : [LoginInformations] = [
        LoginInformations(id: "0524snh", email: "0524snh@coders.com", password: "0524snh1"),
        LoginInformations(id: "0821yjh", email: "0821yjh@coders.com", password: "0821yjh1"),
        LoginInformations(id: "0807khs", email: "0807khs@coders.com", password: "0807khs1")
        
    ]
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func signUpButtonTapped(_ sender: Any) {
    
        if idTextField != nil && emailTextField != nil && passwordTextField != nil {
//            var id:String? = idTextField.text
//            var email:String? = emailTextField.text
//            var passworld:String? = passwordTextField.text
//
            loginData.append(LoginInformations(id: idTextField.text!, email: emailTextField!.text!, password: passwordTextField!.text!))
            
            print(loginData)
            }
        
        
        
        
    }
    
    
}
