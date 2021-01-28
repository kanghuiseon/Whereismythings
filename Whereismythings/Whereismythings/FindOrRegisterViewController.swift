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
       
        
        

        
        
        
        
        print("탭은되고있다")
        
        let stuffname = stuffNameTextField.text ?? ""
        let stuffinfo = stuffInfoTextField.text ?? ""
        let stuffloca = stuffLocaTextField.text ?? ""
        
        
        if Auth.auth().currentUser != nil {
            
        
        let db = Firestore.firestore()
            
            let uid :String = Auth.auth().currentUser?.uid ?? ""
  
            let data: [String: Any] = ["flag":flag,"stuffname":stuffname,"stuffinfo":stuffinfo,"stuffloca":stuffloca]
            
            db.collection("users").document(uid).collection("number").document().setData(data)
            
//            print(uid)
//
//            db.collection("users").document("18KX8EtXmWmayRYPxOuu").collection("stuff").addDocument(data: ["flag":flag,"stuffname":stuffname,"stuffinfo":stuffinfo,"stuffloca":stuffloca])
        } else {
            
            return
            
        }
    }
}
        
        
//'
//FirebaseDataService.instance.userRef.observeSingleEvent(of: .value, with: { (snapshot) in
//    if let data = snapshot.value as? Dictionary<String, AnyObject>, let uid = FirebaseDataService.instance.currentUserUid {
//        for (key, data) in data {
//            if uid != key {
//                if let userData = data as? Dictionary<String, AnyObject> {
//                    let toUid = key
//                    let username = userData["name"] as? String
//                    let email = userData["email"] as? String
//                    let user = User(uid: toUid, email: email!, username: username!)
//                    self.userList.append(user)
//
//        '
//let data: [String: Any] = [:]
//
//        // [START set_data]
//        db.collection("cities").document("new-city-id").setData(data)
//
//
//
        
        
        
        
        
//        db.collection("users").document("18KX8EtXmWmayRYPxOuu").collection("stuff").addDocument(data: ["stuffname":stuffname])
//        db.collection("users").document("18KX8EtXmWmayRYPxOuu").collection("stuff").addDocument(data: ["stuffperson":"송낙현"])
//        db.collection("users").document("18KX8EtXmWmayRYPxOuu").collection("stuff").addDocument(data: ["stuffinfo":stuffinfo])
//        db.collection("users").document("18KX8EtXmWmayRYPxOuu").collection("stuff").addDocument(data: ["stuffloca":stuffloca])
//
        
//
//        print(stuffname)
//
//        MainMapModel.stuffs.append(MainMapModel(id: 16, gotTime: nil, stuffPerson: "익명송낙현", flag: flag, stuffName: stuffname, stuffCharacteristic: stuffinfo, stuffLatitudePosition: "37.5613435", stuffLongitudePosition: "127.0408104", stuffKoreanPosition: stuffloca, stuffImage: nil))
//
//
//        print(MainMapModel.stuffs)
//


    
    
    
    
    
    
    
    
    
    
    
