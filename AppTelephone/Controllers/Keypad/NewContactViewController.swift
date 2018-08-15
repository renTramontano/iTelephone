//
//  NewContactViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 14/08/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit
import CoreData

class NewContactViewController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var surname: UITextField!
    
    var telephoneNumber: String! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        // Save the details of contact in CoreData
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: managedContext)!
        
        let contact = NSManagedObject(entity: entity, insertInto: managedContext)
        contact.setValue(name.text!, forKeyPath: "name")
        contact.setValue(surname.text!, forKeyPath: "surname")
        contact.setValue(telephoneNumber, forKeyPath: "number")
        contact.setValue("telephone", forKey: "type")
        
        do {
            try managedContext.save()
            appDelegate.contacts.append(contact)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        dismiss(animated: true)
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
  
}
