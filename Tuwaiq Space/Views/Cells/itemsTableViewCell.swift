//
//  itemsTableViewCell.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 25/09/1442 AH.
//

import UIKit

class itemsTableViewCell: UITableViewCell {

    @IBOutlet weak var postLbl: UILabel!
    @IBOutlet weak var postDesc: UILabel!
    @IBOutlet weak var postUrl: UILabel!
    @IBOutlet weak var itemImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
