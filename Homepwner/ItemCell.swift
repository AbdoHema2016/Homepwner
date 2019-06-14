//
//  ItemCell.swift
//  Homepwner
//
//  Created by Abdelrhman on 6/29/17.
//  Copyright © 2017 Abdelrhman. All rights reserved.
//

import UIKit
class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var serialNumberLabel:UILabel!
    @IBOutlet var valueLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory=true
        serialNumberLabel.adjustsFontForContentSizeCategory=true
        valueLabel.adjustsFontForContentSizeCategory=true
    }
    
    
}
