//
//  ViewController.swift
//  M-Task
//
//  Created by Kaustubh Gharat on 03/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var matchDetailTBV: UITableView!
    
    
    var arrayTeamHome = [String]()
    var arrayTeamAway = [String]()
    var matchDetails : Match?
    var venueDetail : Venue?
    var teamData : [String:Team] = [:]
    
    var teamHome : String = ""
    var teamAway : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getResponse1()
        getResponse2()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        matchDetailTBV.delegate = self
        matchDetailTBV.dataSource = self
        matchDetailTBV.reloadData()
    }
    
    func getResponse1(){
        let url = "https://demo.sportz.io/nzin01312019187360.json"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { [self] data, resp, err in
            guard let data = data else {
                return
            }
            
            let json = try! JSONDecoder().decode(ResponseModal.self, from: data)
            
            self.teamData = json.teams!
            self.matchDetails = json.matchdetail!.match
            self.venueDetail = json.matchdetail?.venue
            
            
            
            
            self.teamHome = json.matchdetail?.teamHome ?? "No Value Found"
            self.teamAway = json.matchdetail?.teamAway ?? "No Value Found"
            // debugPrint("Team Home = \(self.teamHome) && Team Away = \(self.teamAway)")
            
            //MatchDetail
            //debugPrint(matchDetails!.date!)
            //debugPrint(matchDetails!.time!)
            
            
            //Team Information.
            
            self.arrayTeamHome.append(teamData["\(teamHome)"]!.nameFull!)
            self.arrayTeamAway.append(teamData["\(teamAway)"]!.nameFull!)
            
            //Venue Details.
           // debugPrint(json.matchdetail!.venue!.name ?? "")
            
            
            
            
            
            DispatchQueue.main.async {
                self.matchDetailTBV.reloadData()
            }
        }
        
        task.resume()
        
    }
    func getResponse2(){
        let url = "https://demo.sportz.io/sapk01222019186652.json"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { [self] data, resp, err in
            guard let data = data else {
                return
            }
            
            let json = try! JSONDecoder().decode(ResponseModal.self, from: data)
            
            self.teamData = json.teams!
            self.matchDetails = json.matchdetail!.match
            self.venueDetail = json.matchdetail?.venue
            
            
            
            
            self.teamHome = json.matchdetail?.teamHome ?? "No Value Found"
            self.teamAway = json.matchdetail?.teamAway ?? "No Value Found"
            // debugPrint("Team Home = \(self.teamHome) && Team Away = \(self.teamAway)")
            
            //MatchDetail
            //debugPrint(matchDetails!.date!)
            //debugPrint(matchDetails!.time!)
            
            
            //Team Information.
            
            self.arrayTeamHome.append(teamData["\(teamHome)"]!.nameFull!)
            self.arrayTeamAway.append(teamData["\(teamAway)"]!.nameFull!)
            
            //Venue Details.
           // debugPrint(json.matchdetail!.venue!.name ?? "")
            
            
            
            
            
            DispatchQueue.main.async {
                self.matchDetailTBV.reloadData()
            }
        }
        
        task.resume()
        
    }
    
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTeamHome.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = Bundle.main.loadNibNamed("MatchDetailsTBVC", owner: self, options: nil)?.first as? MatchDetailsTBVC {
            cell.matchDatenTimeLBL.text = "Date : \(self.matchDetails?.date ?? "") | Time : \(self.matchDetails?.time ?? "")"
            cell.teamsLBL.text = "\(arrayTeamHome[indexPath.row]) VS \(arrayTeamAway[indexPath.row])"
            cell.venueLBL.text = "\(venueDetail?.name ?? "")"
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        secondVC.teamData = self.teamData
        secondVC.teamHome = self.teamHome
        secondVC.teamAway = self.teamAway
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
}

