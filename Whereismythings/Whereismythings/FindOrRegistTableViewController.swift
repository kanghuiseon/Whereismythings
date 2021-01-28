//
//  FindOrRegistTableViewController.swift
//  Whereismythings
//
//  Created by JeonghoYang on 2021/01/27.
//

import UIKit

class FindOrRegistTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var pictureLabel: UILabel!
    @IBOutlet weak var stuffNameTextField: UITextField!
    @IBOutlet weak var stuffCharacteristicTextField: UITextField!
    @IBOutlet weak var stuffKoreanPositionTextField: UITextField!
    @IBOutlet weak var FindOrRegistSegmentControl: UISegmentedControl!
   
        var FindOrRegistflag = true
    
    @IBAction func FindOrRegistChange(_ sender: Any) {

        switch FindOrRegistSegmentControl.selectedSegmentIndex {
        case 0:
            FindOrRegistflag = true
        case 1:
            FindOrRegistflag = false
        default:
            break
        }
    }
    
    
    @IBAction func okButtonTapped(_ sendder: UIButton){
        let inPutstuffName = stuffNameTextField.text
        let inPutstuffCharacteristic = stuffCharacteristicTextField.text
        let inPutstuffKoreanPosition = stuffKoreanPositionTextField.text
    
        MainMapModel.tmpStuffs.append(MainMapModel(id: 1, gotTime: nil, stuffPerson: "익명1", flag: FindOrRegistflag, stuffName: inPutstuffName, stuffCharacteristic: inPutstuffCharacteristic, stuffLatitudePosition: "37.5630725", stuffLongitudePosition: "127.0366688", stuffKoreanPosition: inPutstuffKoreanPosition, stuffImage:  imageLiteral(resourceName: "doll"))))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stuffNameTextField.delegate = self
        stuffCharacteristicTextField.delegate = self
        stuffCharacteristicTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        print(stuffNameTextField.text!)
        stuffNameTextField.endEditing(true)
        
        print(stuffCharacteristicTextField.text!)
        stuffCharacteristicTextField.endEditing(true)
        
        print(stuffKoreanPositionTextField.text!)
        stuffKoreanPositionTextField.endEditing(true)
        
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        if textField.text != "" {
            return true
        }
        else{
            textField.placeholder = "내용을 입력해 주세요!"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        stuffNameTextField.text = ""
        stuffCharacteristicTextField.text = ""
        stuffKoreanPositionTextField.text = ""
    }

    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
