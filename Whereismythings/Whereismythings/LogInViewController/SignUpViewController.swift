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
    
//            showError(error!)
        }
        else {
            
            let id = idTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
          
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
             
                if err != nil {
                    let alert = UIAlertController(title: "경고", message: err.debugDescription, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                                    
                    let db = Firestore.firestore()
                  
                    db.collection("users").addDocument(data: ["id":id, "uid":result!.user.uid]) { (error) in
                        if error != nil {
//                            self.showError("유저데이터 세이브에러")
                        }
                        else{
                            let uid = Auth.auth().currentUser?.uid
                            let value = ["uid" : uid, "email" : email]
                            Database.database().reference().child("user").child(uid!).setValue(value, withCompletionBlock: {
                                (err, ref)  in
                                if err == nil{
                                    self.dismiss(animated: true, completion: nil)
                                }
                            })
                        }
                    }
                    
                    // 로긴화면으로 전환함수
                }
          }
            idTextField.text = ""
            emailTextField.text = ""
            passwordTextField.text = ""
            
            
            
     }
  }
}
