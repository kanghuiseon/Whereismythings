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
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = (storyboard?.instantiateViewController(identifier: "MapViewController"))! as MapViewController
        vc.delegate = self
    }
    

   

}
extension DetailStuffViewController:  StuffInfoDelegate{
    func stuffInformation(lblPerson: String, imgStuff: UIImage?, lblStuffName: String, lblStuffPosition: String, lblGotTime: String) {
        self.lblPerson.text = lblPerson
        if let img = imgStuff{
            self.imgStuff = img
        }
        self.lblStuffName.text = lblStuffName
        self.lblStuffPosition.text = lblStuffPosition
        self.lblGotTime.text = lblGotTime
    }
    
}

