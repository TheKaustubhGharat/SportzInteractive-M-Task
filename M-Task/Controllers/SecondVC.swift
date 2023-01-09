//
//  SecondVC.swift
//  M-Task
//
//  Created by Kaustubh Gharat on 08/01/23.
//

import UIKit

class SecondVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var playersTBV: UITableView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    //Variables
    var teamData : [String:Team] = [:]
    var playerInfo : [String: Player] = [:]
    var teamHome : String = ""
    var teamAway : String = ""
    var hpKeyArray = [String]()
    var apKeyArray = [String]()
    var homeTeamPlayers : [String] = []
    var awayTeamPlayers : [String] = []
    var HplayerBattingStyle: [String] = []
    var HplayerBowlingStyle : [String] = []
    var AplayerBattingStyle: [String] = []
    var AplayerBowlingStyle : [String] = []
    var allPlayerBatS : [String] = []
    var allPlayerBowlS : [String] = []
    var allPlayer : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playersTBV.delegate = self
        playersTBV.dataSource = self
        playersTBV.reloadData()
        hpKeyArray = Array((teamData["\(teamHome)"]?.players!.keys)!)
        for homePlayers in hpKeyArray {
            
            if (teamData["\(teamHome)"]?.players!["\(homePlayers)"]?.iscaptain == true) {
                self.homeTeamPlayers.append("\(teamData["\(teamHome)"]?.players!["\(homePlayers)"]?.nameFull ?? "") (Cap)")
            }
            else if (teamData["\(teamHome)"]?.players!["\(homePlayers)"]?.iskeeper == true) {
                self.homeTeamPlayers.append("\(teamData["\(teamHome)"]?.players!["\(homePlayers)"]?.nameFull ?? "") (Wk)")
            }
            else {
                self.homeTeamPlayers.append(teamData["\(teamHome)"]?.players!["\(homePlayers)"]?.nameFull ?? "")
            }
            HplayerBattingStyle.append(teamData["\(teamHome)"]?.players!["\(homePlayers)"]?.batting?.style?.rawValue ?? "No Style")
            HplayerBowlingStyle.append(teamData["\(teamHome)"]?.players!["\(homePlayers)"]?.bowling?.style ?? "No Style")
            
            
            
        }
        
        
        apKeyArray = Array((teamData["\(teamAway)"]?.players!.keys)!)
        for awayPlayers in apKeyArray {
            
            if (teamData["\(teamAway)"]?.players!["\(awayPlayers)"]?.iscaptain == true) {
                self.awayTeamPlayers.append("\(teamData["\(teamAway)"]?.players!["\(awayPlayers)"]?.nameFull ?? "") (Cap)")
            }
            else if (teamData["\(teamAway)"]?.players!["\(awayPlayers)"]?.iskeeper == true) {
                self.awayTeamPlayers.append("\(teamData["\(teamAway)"]?.players!["\(awayPlayers)"]?.nameFull ?? "") (Wk)")
            }
            else {
                self.awayTeamPlayers.append(teamData["\(teamAway)"]?.players!["\(awayPlayers)"]?.nameFull ?? "")
            }
            
            AplayerBattingStyle.append(teamData["\(teamAway)"]?.players!["\(awayPlayers)"]?.batting?.style?.rawValue ?? "No Style")
            
            AplayerBowlingStyle.append(teamData["\(teamAway)"]?.players!["\(awayPlayers)"]?.bowling?.style ?? "Doest Bowl.")
            //debugPrint(AplayerBowlingStyle)
        }
        
        allPlayer = homeTeamPlayers + awayTeamPlayers
        allPlayerBatS = HplayerBattingStyle + AplayerBattingStyle
        allPlayerBowlS = HplayerBowlingStyle + AplayerBowlingStyle
        //  debugPrint(allPlayer)
    }
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        self.playersTBV.reloadData()
    }
    

}

//TableView
extension SecondVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var value = 0
        switch segmentController.selectedSegmentIndex {
        case 0 :   value = homeTeamPlayers.count
            break
        case 1 :   value = awayTeamPlayers.count
            break
        case 2 :  value = homeTeamPlayers.count + awayTeamPlayers.count
            break
        default : value = homeTeamPlayers.count
            break
        }
        return value
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = Bundle.main.loadNibNamed("PlayersTBVC", owner: self, options: nil)?.first as? PlayersTBVC {
            switch segmentController.selectedSegmentIndex {
            case 0 : cell.playerNameLBL.text = homeTeamPlayers[indexPath.row]
                break
            case 1 : cell.playerNameLBL.text = awayTeamPlayers[indexPath.row]
                break
            case 2 : cell.playerNameLBL.text = allPlayer[indexPath.row]
            default: cell.playerNameLBL.text = homeTeamPlayers[indexPath.row]
                break
            }
            
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let playerDetailsVC = storyboard?.instantiateViewController(withIdentifier: "PlayersDetailVC") as! PlayersDetailVC
        switch segmentController.selectedSegmentIndex {
        case 0 :
            playerDetailsVC.name = homeTeamPlayers[indexPath.row]
            playerDetailsVC.battingStyle = HplayerBattingStyle[indexPath.row]
            playerDetailsVC.bowlingStyle = HplayerBowlingStyle[indexPath.row]
            break
        case 1 :
            playerDetailsVC.name = awayTeamPlayers[indexPath.row]
            playerDetailsVC.battingStyle = AplayerBattingStyle[indexPath.row]
            playerDetailsVC.bowlingStyle = AplayerBowlingStyle[indexPath.row]
            break
        case 2 :
            playerDetailsVC.name = allPlayer[indexPath.row]
            playerDetailsVC.battingStyle = allPlayerBatS[indexPath.row]
            playerDetailsVC.bowlingStyle = allPlayerBowlS[indexPath.row]
        default:
           
            break
        }
        self.navigationController?.pushViewController(playerDetailsVC, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
