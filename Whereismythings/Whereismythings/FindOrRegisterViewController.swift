//
//  FindOrRegisterViewController.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/28.
//

import UIKit

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
        
        print(stuffname)
        
        MainMapModel.stuffs.append(MainMapModel(id: 16, gotTime: nil, stuffPerson: "익명송낙현", flag: flag, stuffName: stuffname, stuffCharacteristic: stuffinfo, stuffLatitudePosition: "37.5613435", stuffLongitudePosition: "127.0408104", stuffKoreanPosition: stuffloca, stuffImage: nil))


        print(MainMapModel.stuffs)
  

      }
        
 
    
    
}



    
    
    
    
    
    
    
    
    
    
    
