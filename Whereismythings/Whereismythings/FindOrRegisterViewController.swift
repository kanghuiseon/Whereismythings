//
//  FindOrRegisterViewController.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/28.
//

import UIKit
import Firebase
import MapKit
import CoreLocation
class FindOrRegisterViewController: UITableViewController, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var lostAndFoundSeg: UISegmentedControl!
    
    @IBOutlet weak var stuffNameTextField: UITextField!
    @IBOutlet weak var stuffInfoTextField: UITextField!
    @IBOutlet weak var stuffLocaTextField: UITextField!
    
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    
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
            
            let uid :String = Auth.auth().currentUser!.uid
      
            let data: [String: Any] = ["flag":flag,"stuffname":stuffname,"stuffinfo":stuffinfo,"stuffloca":stuffloca]
                
            db.collection("users").document(uid).collection("number").document().setData(data)
            let currentCoordinate: CLLocationCoordinate2D?
            if let userCurrentPosition = locationManager.location{
                currentCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees((userCurrentPosition.coordinate.latitude)), CLLocationDegrees((userCurrentPosition.coordinate.longitude)))
            }
            else{
                currentCoordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double("37.5753274")!), longitude: CLLocationDegrees(Double("126.973307")!))
            }
            let value = ["uid": uid, "stuffName": stuffname, "flag": flag, "stuffInfo": stuffinfo, "stuffloca": stuffloca, "stuffLatitude": Double(currentCoordinate!.latitude) , "stuffLongitude": Double(currentCoordinate!.longitude)] as [String: Any]
                Database.database().reference().child("user").child(uid).child("stuffs").childByAutoId().setValue(value)
        } else {
            return
        }
        stuffNameTextField.text = ""
        stuffInfoTextField.text = ""
        stuffLocaTextField.text = ""
    }
}
        
