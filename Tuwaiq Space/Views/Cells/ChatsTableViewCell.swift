//
//  ChatsTableViewCell.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 25/09/1442 AH.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {

    @IBOutlet weak var chatPhoto: UIImageView!
    @IBOutlet weak var chatName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
