//
//  SettingsTableCell.swift
//  UrbanPaw
//
//  Created by Mac User on 16/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit

class SettingsTableCell: UITableViewCell {

    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var settingTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
