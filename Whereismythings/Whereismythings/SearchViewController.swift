//
//  SearchViewController.swift
//  Whereismythings
//
//  Created by 강희선 on 2020/12/26.
//

import UIKit
import Firebase
class SearchViewController: UIViewController {
    @IBOutlet var searchTable: UITableView!
    @IBOutlet var navigationBar: UINavigationBar!
    var filteredStuffs:[MainMapModel] = []
    var stuffs:[MainMapModel] = []
    var searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "VisibleStuffTableViewCell", bundle: nil)
        searchTable.register(nib, forCellReuseIdentifier: "visibleCell")
        stuffs = MainMapModel.dataSetting()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Stuff"
        //여기요
        let navItem = UINavigationItem(title: "")
        navItem.searchController = searchController
        navigationBar.pushItem(navItem, animated: true)
        definesPresentationContext = true
    }
    
    func searchBarIsEmpty() -> Bool {
      // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
      
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredStuffs = stuffs.filter({(stuff: MainMapModel) -> Bool in
            return stuff.stuffName.lowercased().contains(searchText.lowercased())
      })
      searchTable.reloadData()
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension SearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    

}

extension SearchViewController: UITableViewDelegate{
    
}

extension SearchViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            return filteredStuffs.count
        }
        return stuffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "visibleCell", for: indexPath) as! VisibleStuffTableViewCell
          let stuff: MainMapModel
          if isFiltering() {
            stuff = filteredStuffs[indexPath.row]
          } else {
            stuff = stuffs[indexPath.row]
          }
        if let img = stuff.stuffImage{
            cell.stuffImg.image = img
        }
        else{
            cell.stuffImg.image = UIImage(named: "unchecked")
        }
        cell.stuffName.text = stuff.stuffName
        cell.stuffPos.text = stuff.stuffKoreanPosition
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = filteredStuffs[indexPath.row].flag ? "GetStuffViewController" : "LostStuffViewController"
        let searchVC = storyboard.instantiateViewController(identifier: identifier) as! DetailStuffViewController
        searchVC.stuffInformation(uid: filteredStuffs[indexPath.row].id , lblPerson: filteredStuffs[indexPath.row].stuffPerson, imgStuff: filteredStuffs[indexPath.row].stuffImage, lblStuffName: filteredStuffs[indexPath.row].stuffName, lblStuffPosition: filteredStuffs[indexPath.row].stuffKoreanPosition, lblGotTime: nil)
        present(searchVC, animated: true, completion: nil)
        
    }
    
    
}
