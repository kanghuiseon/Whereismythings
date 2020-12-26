//
//  ViewController.swift
//  tableViewTest
//
//  Created by 송낙현 on 2020/12/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    


    var personRgst : [Personss] = [
        Personss(name: "송낙현", location: "수원",age: 35),
        Personss(name: "양정호", location: "수지",age: 33),
        Personss(name: "강희선", location: "십리",age: 25)
    ]
    
    
    
  
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
      //  tableView.dataSource = self
   
        
   
    
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personRgst.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewVell
    
        cell.textLabel?.text = personRgst[indexPath.row].name
        cell.detailTextLabel?.text = personRgst[indexPath.row].location
        cell.lable1.text = String(personRgst[indexPath.row].age)
        return cell
    
       
     


    }
    

    
    
    

}


class TableViewVell : UITableViewCell {
    
    
    @IBOutlet weak var lable1: UILabel!
    
    
    
    
    
    
    
    
    
}
