//
//  ConTableViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 25/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class ConTableViewController: UITableViewController {

    @IBOutlet var imageProfile: UIImageView!
    @IBOutlet var nameProfile: UILabel!
    @IBOutlet var numberProfile: UILabel!
    
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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        nameProfile.text = "Renato Tramontano"
        numberProfile.text = "My number is: +39 3385025934"
        imageProfile.image = #imageLiteral(resourceName: "ren")
        imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
        imageProfile.clipsToBounds = true
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
    
}
