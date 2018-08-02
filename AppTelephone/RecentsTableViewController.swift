//
//  RecentsTableViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 24/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class RecentsTableViewController: UITableViewController {
    
    var contacts: [Contact]
    
    required init?(coder aDecoder: NSCoder) {
        contacts = [Contact]()
        
        let names = ["Renato Tramontano", "Jessica Sodano", "Antonio di Giovanni", "Pierpaolo Sepe"]
        let photos = [#imageLiteral(resourceName: "ren"), #imageLiteral(resourceName: "jessica"), #imageLiteral(resourceName: "toto"), #imageLiteral(resourceName: "pier")]
        let lastCall = ["15:17", "19:21", "12:31", "13:13"]
        
        for i in 0..<names.count {
            let contact = Contact()
            contact.name = names[i]
            contact.type = "telephone"
            contact.imageContact = photos[i]
            contact.lastCall = lastCall[i]
            contacts.append(contact)
        }
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let items = ["All", "Losts"]
        let segmetedController = UISegmentedControl(items: items)
        segmetedController.setWidth(view.frame.width/5, forSegmentAt: 0)
        segmetedController.setWidth(view.frame.width/5, forSegmentAt: 1)
        segmetedController.selectedSegmentIndex = 0
        navigationItem.titleView = segmetedController
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentsTableViewCell
        cell.contact.text = contacts[indexPath.row].name
        cell.type.text = contacts[indexPath.row].type
        cell.time.text = contacts[indexPath.row].lastCall
        cell.imageRecents.image = #imageLiteral(resourceName: "call")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        contacts.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }


}
