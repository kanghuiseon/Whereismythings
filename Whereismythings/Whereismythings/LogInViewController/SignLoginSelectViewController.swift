//
//  SignLoginSelectViewController.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/15.
//

import UIKit
import Firebase

class SignLoginSelectViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        
        
       let fireSignout = Auth.auth()
        do {
            try fireSignout.signOut()
        }catch let signoutError as NSError{
            
            print("에러",signoutError)
        }
        
    }
    
    
    
    
}
