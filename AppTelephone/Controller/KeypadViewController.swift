//
//  KeypadViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 25/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class KeypadViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.cornerRadius = button.frame.width / 2
            button.clipsToBounds = true
        }
    }

   

}
