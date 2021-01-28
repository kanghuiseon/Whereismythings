//
//  DetailStuffViewController.swift
//  Whereismythings
//
//  Created by 강희선 on 2021/01/14.
//

import UIKit
import Firebase

class DetailStuffViewController: UIViewController {
    @IBOutlet var lblPerson: UILabel!
    @IBOutlet var imgStuff: UIImageView!
    @IBOutlet var lblStuffName: UILabel!
    @IBOutlet var lblStuffPosition: UILabel!
    @IBOutlet var lblGotTime: UILabel!
    
    
    
    @IBAction func massageButtonTapped(_ sender: UIButton) {
        
       
        
        if Auth.auth().currentUser != nil {
        
            
            //상대편 유저 자동추가 되게 이해안되면 카톡
        
            let chatboard = UIStoryboard(name: "Chat", bundle: nil)
            if let vc = chatboard.instantiateInitialViewController() { // .instantiateViewController(identifier: "chattingStart") as? ChatGroupViewController {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }else{
            let loginboard = UIStoryboard(name: "login", bundle: nil)
            if let vc = loginboard.instantiateInitialViewController() { // .instantiateViewController(identifier: "chattingStart") as? ChatGroupViewController {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
        
        }
        }
    }
    
    
    var person: String!
    var img: UIImage?
    var name: String!
    var position: String!
    var time: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()
        
    }
    

    func setValues(){
        self.lblPerson.text = person
        if let img = img{
            self.imgStuff.image = img
        }
        self.lblStuffName.text = name
        self.lblStuffPosition.text = position
        if let time = time{
            self.lblGotTime.text = time
        }
    }
}
//extension DetailStuffViewController:  StuffInfoDelegate{
extension DetailStuffViewController{
    func stuffInformation(lblPerson: String, imgStuff: UIImage?, lblStuffName: String, lblStuffPosition: String, lblGotTime: String?) {
        self.person = lblPerson
        if let img = imgStuff{
            self.img = img
        }
        self.name = lblStuffName
        self.position = lblStuffPosition
        if let time = lblGotTime{
            self.time = time
        }
    }
    
    
    
    
    
    

}

