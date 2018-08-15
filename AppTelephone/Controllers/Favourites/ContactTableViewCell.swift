//
//  ContactTableViewCell.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 24/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet var imageContact: UIImageView!
    @IBOutlet var nameContact: UILabel!
    @IBOutlet var typeNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Aspect of profile image
        imageContact.layer.cornerRadius = imageContact.layer.frame.width / 2
        imageContact.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
