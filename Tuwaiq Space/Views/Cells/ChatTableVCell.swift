//
//  ChatTableVCellTableViewCell.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 25/09/1442 AH.
//

import UIKit

class ChatTableVCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    enum sender{
        case me
        case other
    }
    func getMessageDesign(sender: sender){
        var backGroundColor : UIColor?
        switch sender {
        case .me:
            backGroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            messageView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMaxYCorner,.layerMinXMaxYCorner]
            messageLabel?.textAlignment = .right
        case .other:
            backGroundColor = #colorLiteral(red: 1, green: 0.915027242, blue: 0.5722517893, alpha: 1)
            messageView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMaxYCorner,.layerMaxXMaxYCorner]
            messageLabel?.textAlignment = .left
        default:
            break
        }
        messageView.backgroundColor = backGroundColor
        messageView.layer.cornerRadius = messageLabel.frame.size.height / 2.5
        messageView.layer.shadowOpacity = 0.1
        
        
    }


}
