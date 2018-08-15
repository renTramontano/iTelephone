//
//  ViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 24/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.

import UIKit
import CoreData

class FavouritesTableViewController: UITableViewController {
    
    @IBOutlet var modifyButton: UIBarButtonItem!
    var contacts: [Contact] = []
    
    // CoreData storage
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Recovers data stored in core data
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contact")
        do {
            appDelegate.contacts = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        // Show only favorite contacts
        contacts = (appDelegate.contacts as! [Contact]).filter({ (contact) -> Bool in
            contact.isFavorite == true
        })
        
        // If there is no data show a notification message
        if contacts.count == 0 {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text = "No favorite avalible"
            noDataLabel.font = UIFont(name: "SanFranciscoDisplay-Regular", size: 30)
            noDataLabel.textColor = UIColor.gray
            noDataLabel.textAlignment = .center
            tableView.backgroundView = noDataLabel
            tableView.separatorStyle = .none
            self.modifyButton.title = ""
            self.modifyButton.isEnabled = false
        } else {
            tableView.separatorStyle = .singleLine
            tableView.backgroundView = nil
            self.modifyButton.title = "Modify"
            self.modifyButton.isEnabled = true
        }
        
        tableView.reloadData()
    }
    
    // MARK: - TableView's methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
        cell.nameContact.text = contacts[indexPath.row].name! + " " + contacts[indexPath.row].surname!
        cell.typeNumber.text = contacts[indexPath.row].type!
        cell.imageContact.image = (contacts[indexPath.row].value(forKey: "imageContact") as? UIImage) ?? #imageLiteral(resourceName: "unknowPerson")
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // Delete the cells from the table view
        contacts[indexPath.row].isFavorite = false
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
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

