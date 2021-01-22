//
//  DetailStuffViewController.swift
//  Whereismythings
//
//  Created by 강희선 on 2021/01/14.
//

import UIKit

class DetailStuffViewController: UIViewController {
    @IBOutlet var lblPerson: UILabel!
    @IBOutlet var imgStuff: UIImage!
    @IBOutlet var lblStuffName: UILabel!
    @IBOutlet var lblStuffPosition: UILabel!
    @IBOutlet var lblGotTime: UILabel!
    var person: String!
    var img: UIImage?
    var name: String!
    var position: String!
    var time: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblPerson.text = person
        self.imgStuff = img
        self.lblStuffName.text = name
        self.lblStuffPosition.text = position
        self.lblGotTime.text = time
    }
    

   

}
//extension DetailStuffViewController:  StuffInfoDelegate{
extension DetailStuffViewController{
    func stuffInformation(lblPerson: String, imgStuff: UIImage?, lblStuffName: String, lblStuffPosition: String, lblGotTime: String?) {
        self.person = lblPerson
        if let img = self.img{
            self.imgStuff = img
        }
        self.name = lblStuffName
        self.position = lblStuffPosition
        if let time = lblGotTime{
            self.time = time
        }
    }

}

