//
//  RecetasDetailViewCell.swift
//  CocinaDominicana
//
//  Created by Juan Morillo on 23/8/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class RecetasDetailViewCell: UITableViewCell {
    
     @IBOutlet weak var keyValueLabel: UILabel!
     @IBOutlet weak var  ValueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
