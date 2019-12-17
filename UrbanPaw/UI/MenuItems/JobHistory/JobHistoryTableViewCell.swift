//
//  JobHistoryTableViewCell.swift
//  UrbanPaw
//
//  Created by Mac User on 13/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit

class JobHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var mHistoryimage: UIImageView!
    @IBOutlet weak var mHistoryName: UILabel!
    @IBOutlet weak var mUserName: UILabel!
    @IBOutlet weak var mPetType: UILabel!
    @IBOutlet weak var viewdetailslbl: UIButton!
    @IBOutlet weak var mHistoryStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
