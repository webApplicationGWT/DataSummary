//
//  ViewController.swift
//  DataSummary
//
//  Created by App Developer on 17/12/18.
//  Copyright © 2018 muni. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var refreshC : UIRefreshControl!
   
    let section = ["pizza", "deep dish pizza", "calzone"]
    
    let items = [["Margarita", "BBQ Chicken", "Pepperoni"], ["sausage", "meat lovers", "veggie lovers"], ["sausage", "chicken pesto", "prawns", "mushrooms"]]
  
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionId = section
        return self.section[sectionId]
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.section.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionId = section
        return self.items[sectionId].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshC = UIRefreshControl()
        refreshC.attributedTitle = NSAttributedString(string: "Fetching data...")
        refreshC.tintColor = UIColor.orange
        refreshC.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshC)
    }
    
    @objc func refresh(_ sender: Any) {
       print("Refresh")
        refreshC.endRefreshing()
    }
}
