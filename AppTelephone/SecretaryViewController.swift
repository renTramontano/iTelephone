//
//  SecretaryViewController.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 25/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class SecretaryViewController: UIViewController {
    
    @IBOutlet var secretayCall: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        secretayCall.layer.borderWidth = 1
        secretayCall.layer.borderColor = UIColor.gray.cgColor
        secretayCall.layer.cornerRadius = 5
    }

}
