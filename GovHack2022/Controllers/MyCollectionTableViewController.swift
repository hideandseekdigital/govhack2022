//
//  MyCollectionTableViewController.swift
//  GovHack2022
//
//  Created by Adam Balzan on 20/8/2022.
//

import UIKit
import MapKit

class MyCollectionTableViewController: UITableViewController {

    var items = Array(FaunaHabitatDAO.shared.distinctFaunaNames.values)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "My Collection"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let item = items[indexPath.row]
        cell?.textLabel?.text = item.nameCommon
        cell?.detailTextLabel?.text = "\(item.geometry?.coordinates.first?.count ?? 0)"
        return cell ?? UITableViewCell()
    }
     
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        guard let item = items[safe: indexPath.row] else { return }
        let controller = InfoTableViewController.controller(fauna: item)
        let navController = UINavigationController(rootViewController: controller)
        navController.setNavigationBarHidden(true, animated: false)
        self.navigationController?.present(navController, animated: true, completion: nil)
        
    }
    

}
