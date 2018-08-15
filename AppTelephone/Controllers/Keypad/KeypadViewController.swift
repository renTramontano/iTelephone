//
//  KeypadViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 25/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class KeypadViewController: UIViewController {

    @IBOutlet var number: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var addNumberButton: UIButton!
    @IBOutlet var deleteNumberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The aspect of phone buttons
        for button in buttons {
            button.layer.cornerRadius = button.frame.width / 2
            button.clipsToBounds = true
        }
        
        // Hide the hide button and the addContact when no numbers is entered
        number.text = ""
        addNumberButton.alpha = 0
        deleteNumberButton.alpha = 0
    }

   
    @IBAction func insertNumber(_ sender: UIButton) {
        // Update the displayed number
        hideAndShowButtons(alpha: 1, duration: 0.2)
        number.text! += (sender.titleLabel?.text)!
    }
    
    @IBAction func addNumber(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Action to create a new contact
        let createContact = UIAlertAction(title: "Create new contact", style: .default, handler: { alert in
            let storyboard: UIStoryboard = UIStoryboard(name: "Keypad", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "NewContactID") as! NewContactViewController
            vc.telephoneNumber = self.number.text
            self.present(vc, animated: true)
        })
        alertController.addAction(createContact)
        
        // TODO: Action to add a number to an existing contact
        let addContact = UIAlertAction(title: "Add to contact", style: .default, handler: nil)
        alertController.addAction(addContact)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func deleteNumber(_ sender: UIButton) {
        // Remove the last number and hides the buttons 'addContact' and 'removeNumber' when there is no number
        number.text?.removeLast()
        
        if (number.text?.isEmpty)! {
            hideAndShowButtons(alpha: 0, duration: 0.6)
        }
    }
    
    func hideAndShowButtons(alpha: CGFloat, duration: Double) {
        // Animate the entry and exit of the buttons 'addContact' and 'deleteNumber'
        UIView.animate(withDuration: duration) {
            self.addNumberButton.alpha = alpha
            self.deleteNumberButton.alpha = alpha
        }
    }
}
