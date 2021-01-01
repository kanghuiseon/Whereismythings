//
//  ViewController.swift
//  TableViewAssignment
//
//  Created by 강희선 on 2021/01/01.
//

import UIKit

class TableViewController: UITableViewController{
    @IBOutlet var tv: UITableView!
    var names: [String] = ["강희선","송낙현","양정호"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? UITableViewCell{
            let dest = segue.destination as! NextViewController
            dest.name = (sender.textLabel?.text)!
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}

