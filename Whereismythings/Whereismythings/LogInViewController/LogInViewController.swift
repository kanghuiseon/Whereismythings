//
//  LogInViewController.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/15.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    var loginData : [LoginInformations] = [
        LoginInformations(id: "0524snh", email: "0524snh@coders.com", password: "0524snh1"),
        LoginInformations(id: "0821yjh", email: "0821yjh@coders.com", password: "0821yjh1"),
        LoginInformations(id: "0807khs", email: "0807khs@coders.com", password: "0807khs1")
    ]

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        //로그인 데이터랑 텍스트필드 데이터가 트루이면 프린트핼
        
        if loginData[0].email == emailTextField.text && loginData[0].password == passwordTextField.text {
            
            guard let vc = self.storyboard?.instantiateViewController(identifier: "cptLogIn") as? completeLogInViewController else{
                return
            }
            self.present(vc, animated: true)
                    
           
        }
     
    }
    
    
}
