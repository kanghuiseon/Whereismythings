//
//  LogInViewController.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/15.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
    }
    
    
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
//        //로그인 데이터랑 텍스트필드 데이터가 트루이면 프린트핼
//        //for 돌리면 되는건가
//        //prepare 사용해서도 해보자
//        if loginData[0].email == emailTextField.text && loginData[0].password == passwordTextField.text {
//
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
   
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                let chatboard = UIStoryboard(name: "Chat", bundle: nil)
                if let vc = chatboard.instantiateViewController(identifier: "chattingStart")as? ChatGroupViewController {
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                                       
                }
            }
        }
        
    }
    
}

    

