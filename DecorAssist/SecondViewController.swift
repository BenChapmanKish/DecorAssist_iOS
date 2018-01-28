//
//  SecondViewController.swift
//  DecorAssist
//
//  Created by Ben Chapman-Kish on 2018-01-28.
//  Copyright © 2018 Big Poppa Productions. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var response: [String : AnyObject] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: "RoomTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "roomTableViewReuseIdentifier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let urlString = "https://flask-decorassistant.herokuapp.com/homepage"
        
        Alamofire.request(urlString).responseJSON { response in
            
            if let json = response.result.value {
                guard let data = json as? [String : AnyObject] else {
                    return
                }
                
                self.response = data
                
                self.welcomeLabel.text = String.localizedStringWithFormat("Welcome, %@", data["user"]!["name"] as! String)
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    internal func tableView(_ tableView: UITableView, numberOfSections: Int) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard self.response["rooms"] != nil else {
            return 0
        }
        let rooms: [[String: AnyObject]] = self.response["rooms"] as! [[String : AnyObject]]
        return rooms.count
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RoomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "roomTableViewReuseIdentifier", for: indexPath as IndexPath) as! RoomTableViewCell
        
        guard self.response["rooms"] != nil else {
            cell.configureCell(roomType: "-", furniture: ["-"])
            return cell
        }
        
        let rooms: [[String: AnyObject]] = self.response["rooms"] as! [[String : AnyObject]]
        
        if (rooms.count > 0) {
            //let roomType: String = rooms[indexPath.row]["type"] as! String
            let roomType: String = "bedroom" // hardcode since the server's broke and Erick's asleep
            let furniture: [String] = rooms[indexPath.row]["furniture"] as! [String]
            cell.configureCell(roomType: roomType, furniture: furniture)
        } else {
            cell.configureCell(roomType: "-", furniture: ["-"])
        }
        
        return cell
    }

}

