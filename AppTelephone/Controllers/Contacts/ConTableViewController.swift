//
//  ConTableViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 25/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit
import CoreData

class ConTableViewController: UITableViewController {

    @IBOutlet var imageProfile: UIImageView!
    @IBOutlet var nameProfile: UILabel!
    @IBOutlet var numberProfile: UILabel!
    
    var contacts: [Contact] = []
    var sections: Set = Set<Character>()
    var allContacts: [[Contact]] = [[Contact]]()
    
    // Letters of indexList of tableView
    var letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","#"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Search Bar
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        // Personal Data
        nameProfile.text = "Unknown"
        numberProfile.text = "My number is: Unknown"
        imageProfile.image = #imageLiteral(resourceName: "unknowPerson")
        imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
        imageProfile.clipsToBounds = true
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        contacts = appDelegate.contacts as! [Contact]
        
        // Sort contacts by last name
        contacts.sort {
            $0.surname! > $1.surname!
        }
        
        // List of sections
        for contact in contacts {
            sections.insert((contact.surname?.first!)!)
        }
        
        // List of contacts divided by alphabet
        for i in 0..<sections.count {
            allContacts.append(contacts.filter({ (contact) -> Bool in
                contact.surname?.first! == Array(sections)[i].description.first
            }))
        }
        
        // TODO: Search contact
    }
    
    // MARK: - TableView's methods
    
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
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return letters
    }
    
}
