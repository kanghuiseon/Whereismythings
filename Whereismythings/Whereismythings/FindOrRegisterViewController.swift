//
//  FindOrRegisterViewController.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/28.
//

import UIKit
import Firebase

class FindOrRegisterViewController: UITableViewController {
    
    
    
    @IBOutlet weak var lostAndFoundSeg: UISegmentedControl!
    
    @IBOutlet weak var stuffNameTextField: UITextField!
    @IBOutlet weak var stuffInfoTextField: UITextField!
    @IBOutlet weak var stuffLocaTextField: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    var flag: Bool = true
    
    @IBAction func lostAndFoundSeg(_ sender: UISegmentedControl) {
        
        
        switch lostAndFoundSeg.selectedSegmentIndex {
          case 0:
            flag = true
          case 1:
            flag = false
          default:
              break

    
        
        
        }
    
    }
    
    

    @IBAction func ComButtonTapped(_ sender: UIButton) {
       
        let stuffname = stuffNameTextField.text ?? ""
        let stuffinfo = stuffInfoTextField.text ?? ""
        let stuffloca = stuffLocaTextField.text ?? ""
        
        
        if Auth.auth().currentUser != nil {
            
        
        let db = Firestore.firestore()
            
            let uid :String = Auth.auth().currentUser?.uid ?? ""
  
            let data: [String: Any] = ["flag":flag,"stuffname":stuffname,"stuffinfo":stuffinfo,"stuffloca":stuffloca]
            
            db.collection("users").document(uid).collection("number").document().setData(data)
            

        } else {
            
            return
            
        }
    }
}
        
