//
//  ContactsTableViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 24/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit
import CoreData

// TODO: Use the same class contained in contacts and eliminate this
class ContactsTableViewController: UITableViewController {
    
    var contacts: [Contact] = []
    var sections: Set = Set<Character>()
    var allContacts: [[Contact]] = [[Contact]]()
    var letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","#"]
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.prompt = "Choose a contact to add to favorites"
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contact")
        
        do {
            appDelegate.contacts = try managedContext.fetch(fetchRequest)
            contacts = appDelegate.contacts as! [Contact]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        contacts.sort {
            $0.surname! > $1.surname!
        }
        
        for contact in contacts {
            sections.insert((contact.surname?.first!)!)
        }
        
        for i in 0..<sections.count {
            allContacts.append(contacts.filter({ (contact) -> Bool in
                contact.surname?.first! == Array(sections)[i].description.first
            }))
        }
        
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return allContacts.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(sections)[section].description
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allContacts[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = allContacts[indexPath.section][indexPath.row].name! + " " + allContacts[indexPath.section][indexPath.row].surname!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        allContacts[indexPath.section][indexPath.row].isFavorite = true
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        dismiss(animated: true)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return letters
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
