//
//  ContactsTableViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 24/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contacts: [Contact]
    var sections: [String]
    //var allContacts: [[Contact]]
    
    required init?(coder aDecoder: NSCoder) {
        contacts = [Contact]()
        
        let names = ["Renato Tramontano", "Jessica Sodano", "Antonio di Giovanni", "Pierpaolo Sepe"]
        sections = ["D", "S", "T"]
        
        for i in 0..<names.count {
            let contact = Contact()
            contact.name = names[i]
            contact.type = "telephone"
            contacts.append(contact)
        }
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.prompt = "Choose a contact to add to favorites"
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        return cell
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
