//
//  PlayersDetailVC.swift
//  M-Task
//
//  Created by Tech Team on 09/01/23.
//

import UIKit

class PlayersDetailVC: UIViewController {
    @IBOutlet weak var playerNameLBL: UILabel!
    @IBOutlet weak var battingStyleLBL: UILabel!
    @IBOutlet weak var bowlingStyleLBL: UILabel!
    
    var name : String = ""
    var battingStyle : String = ""
    var bowlingStyle : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerNameLBL.text = "Player Name : \(name)"
        battingStyleLBL.text = "Batting Style : \(battingStyle) "
        if bowlingStyle == "" {
            bowlingStyleLBL.text = "Bowling Style : Doesnt Bowl"
        } else {
            bowlingStyleLBL.text = "Bowling Style : \(bowlingStyle)"

        }
        
        
    }
    

    

}
