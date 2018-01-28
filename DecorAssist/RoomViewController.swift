//
//  RoomViewController.swift
//  DecorAssist
//
//  Created by Ben Chapman-Kish on 2018-01-28.
//  Copyright © 2018 Big Poppa Productions. All rights reserved.
//

import UIKit

class RoomViewController: UIViewController {
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    @IBOutlet weak var furnitureLabel: UILabel!
    
    var room: [String: AnyObject] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let roomType = self.room["type"] as? String else {
                return
        }
        guard let furniture = self.room["furniture"] as? [String] else {
            return
        }
        
        self.roomTypeLabel.text = roomType
        self.furnitureLabel.text = furniture.joined(separator: "\n")
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
