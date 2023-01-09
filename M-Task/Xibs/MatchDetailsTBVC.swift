//
//  MatchDetailsTBVC.swift
//  M-Task
//
//  Created by Kaustubh Gharat on 08/01/23.
//

import UIKit

class MatchDetailsTBVC: UITableViewCell {
    @IBOutlet weak var matchDatenTimeLBL: UILabel!
    @IBOutlet weak var teamsLBL: UILabel!
    @IBOutlet weak var venueLBL: UILabel!
    @IBOutlet weak var view: UIView!
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
