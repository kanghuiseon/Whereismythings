//
//  SignUpViewController.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/15.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore





class SignUpViewController: UIViewController {

    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func validateFields() -> String? {
        

        if  idTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
              
        {
            
            return "전부 안채우는 애러"
        }
        
     
            
        return nil
    }
    
    

    @IBAction func signUpButtonTapped(_ sender: Any) {
    
        let error = validateFields()
        
        if error != nil {
    
            showError(error!)
        }
        else {
            
            let id = idTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
          
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
             
                if err != nil {
    
                    self.showError("유저생성에러")
                    
                }
                else {
                                    
                    let db = Firestore.firestore()
                  
                    db.collection("users").addDocument(data: ["id":id, "uid":result!.user.uid]) { (error) in
                        if error != nil {
                            self.showError("유저데이터 세이브에러")

                
                    
                        }
                    }
                    
                    // 로긴화면으로 전환함수
                    
                }
          }
            
            
            
     }
  }
        
        
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
        
    
    
}
