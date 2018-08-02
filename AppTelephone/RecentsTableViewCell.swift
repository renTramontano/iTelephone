//
//  RecentsTableViewCell.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 25/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class RecentsTableViewCell: UITableViewCell {

    @IBOutlet var imageRecents: UIImageView!
    @IBOutlet var contact: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var time: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
