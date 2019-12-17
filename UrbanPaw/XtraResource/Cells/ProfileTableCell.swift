//
//  ProfileTableCell.swift
//  UrbanPaw
//
//  Created by Mac User on 17/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit

class ProfileTableCell: UITableViewCell {

    @IBOutlet weak var profileDesc: UILabel!
    @IBOutlet weak var profileTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
