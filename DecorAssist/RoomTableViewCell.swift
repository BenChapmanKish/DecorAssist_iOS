//
//  RoomTableViewCell.swift
//  DecorAssist
//
//  Created by Ben Chapman-Kish on 2018-01-28.
//  Copyright © 2018 Big Poppa Productions. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var roomTypeLabel: UILabel!
    @IBOutlet weak var furnitureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(roomType: String, furniture: [String]) {
        self.roomTypeLabel.text = roomType
        self.furnitureLabel.text = furniture.joined(separator: "\n")
    }
    
}
