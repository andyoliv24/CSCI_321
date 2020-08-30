//
//  PresidentCell.swift
//  assignment4
//
//  Created by Andy Olivares on 4/12/20.
//  Copyright © 2020 Andy Olivares. All rights reserved.
//

import UIKit

class PresidentCell: UITableViewCell {

    @IBOutlet weak var presidentImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var politicalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
