//
//  ViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 24/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class FavouritesTableViewController: UITableViewController {
    
    var contacts: [Contact]
    
    required init?(coder aDecoder: NSCoder) {
        contacts = [Contact]()
        
        let names = ["Renato Tramontano", "Jessica Sodano", "Antonio di Giovanni", "Pierpaolo Sepe"]
        let photos = [#imageLiteral(resourceName: "ren"), #imageLiteral(resourceName: "jessica"), #imageLiteral(resourceName: "toto"), #imageLiteral(resourceName: "pier")]
        
        for i in 0..<names.count {
            let contact = Contact()
            contact.name = names[i]
            contact.type = "telephone"
            contact.imageContact = photos[i]
            contacts.append(contact)
        }
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
        cell.nameContact.text = contacts[indexPath.row].name
        cell.typeNumber.text = contacts[indexPath.row].type
        cell.imageContact.image = contacts[indexPath.row].imageContact
    
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        contacts.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let rowTMP = contacts[sourceIndexPath.row]
        contacts.remove(at: sourceIndexPath.row)
        contacts.insert(rowTMP, at: destinationIndexPath.row)
    }

    @IBAction func modifyTable(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
        sender.title = (tableView.isEditing) ? "Done" : "Modify"
    }
}

