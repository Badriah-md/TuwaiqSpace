//
//  ItemTableViewCell.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 22/09/1442 AH.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImg: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemAuthor: UILabel!
    //    @IBOutlet weak var itemImg: UIImageView?
//    @IBOutlet weak var itemName: UILabel?
//    @IBOutlet weak var itemAuthor: UILabel?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
