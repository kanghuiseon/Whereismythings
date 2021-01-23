//
//  VisibleStuffViewController.swift
//  Whereismythings
//
//  Created by 강희선 on 2021/01/23.
//

import UIKit

class VisibleStuffViewController: UIViewController {
    @IBOutlet var visibleTableView: UITableView!
    var visibleStuffs:[MapAnnotation] = []
    let nib = UINib(nibName: "VisibleStuffTableViewCell",bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        visibleTableView.register(nib, forCellReuseIdentifier: "visibleCell")
    }
}
extension VisibleStuffViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleStuffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "visibleCell") as? VisibleStuffTableViewCell else { return UITableViewCell() }
        if let img = visibleStuffs[indexPath.row].stuffImage{
            cell.stuffImg.image = img
        }
        cell.stuffName.text = visibleStuffs[indexPath.row].stuffName
        cell.stuffPos.text = visibleStuffs[indexPath.row].stuffKoreanPosition
        return cell
    }
    
    
}
extension VisibleStuffViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let identifier = visibleStuffs[indexPath.row].flag ? "GetStuffViewController" : "LostStuffViewController"
        let annotation = visibleStuffs[indexPath.row]
        let detailVC = storyboard?.instantiateViewController(identifier: identifier) as! DetailStuffViewController
        detailVC.stuffInformation(lblPerson: annotation.stuffPerson, imgStuff: annotation.stuffImage, lblStuffName: annotation.stuffName, lblStuffPosition: annotation.stuffKoreanPosition, lblGotTime: annotation.time)
        present(detailVC, animated: true, completion: nil)
    }
}
