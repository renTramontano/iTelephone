//
//  RecentsTableViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 24/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class RecentsTableViewController: UITableViewController {
    
    var contacts: [Contact] = []
    var recentCall: [[Contact]] = [[Contact]]() // Missed calls and received calls
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Segmente Controller as title of the navigationController
        let items = ["All", "Losts"]
        let segmetedController = UISegmentedControl(items: items)
        segmetedController.setWidth(view.frame.width/5, forSegmentAt: 0)
        segmetedController.setWidth(view.frame.width/5, forSegmentAt: 1)
        segmetedController.selectedSegmentIndex = 0
        navigationItem.titleView = segmetedController
    }
    
    // MARK: - TableView's methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    // TODO: Show recent call and lost call
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentsTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // Delete the cells from the table view
        contacts.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Edit the table view cells
        let rowTMP = contacts[sourceIndexPath.row]
        contacts.remove(at: sourceIndexPath.row)
        contacts.insert(rowTMP, at: destinationIndexPath.row)
    }
    
    @IBAction func modifyTable(_ sender: UIBarButtonItem) {
        // Change the appearance of the view according to whether it is editable or not
        tableView.isEditing = !tableView.isEditing
        sender.title = (tableView.isEditing) ? "Done" : "Modify"
    }


}
