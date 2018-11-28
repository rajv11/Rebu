//
//  AnnouncementViewController.swift
//  Rebus
//
//  Created by student on 10/5/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class AnnouncementTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Anouncements.anounce.anouncementTakeRide.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell  =  tableView.dequeueReusableCell(withIdentifier: "announcementCell")!
        
        var data:Anouncement
        
        if Anouncements.anounce.rideSelect == "Take"
        {
            data = Anouncements.anounce.anouncementTakeRide[indexPath.row]
            cell.textLabel?.text = data.name
            cell.detailTextLabel?.text = data.endPoint
            
        }
            
        else
        {
            data = Anouncements.anounce.anouncementGiveRide[indexPath.row]
            cell.textLabel?.text = data.name
            cell.detailTextLabel?.text = data.startPoint
        }
        
//        cell.textLabel?.text = data.name
//        cell.detailTextLabel?.text = data.endPoint
//
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelPost(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
