//
//  PlayersTBVC.swift
//  M-Task
//
//  Created by Kaustubh Gharat on 09/01/23.
//

import UIKit

class PlayersTBVC: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var playerNameLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.view.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
