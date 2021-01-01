//
//  NextViewController.swift
//  TableViewAssignment
//
//  Created by 강희선 on 2021/01/01.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet var lblName: UILabel!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = name
    }
    


}
