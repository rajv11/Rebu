//
//  AnnouncementViewController.swift
//  Rebus
//
//  Created by student on 10/5/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class AnnouncementTableViewController: UITableViewController {
    

    var announcmentData:Anouncements!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        announcmentData = Anouncements.anounce
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var items:Int
        if announcmentData.rideSelect == "Take"
        {
        items = announcmentData.anouncementGiveRide.count
        }
        else
        {
            items = announcmentData.anouncementTakeRide.count
        }
        return items
    }
    override func viewWillAppear(_ animated: Bool) {
        announcmentData.retrieveAllGiveRides()
       announcmentData.retrieveAllTakeRides()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell  =  tableView.dequeueReusableCell(withIdentifier: "announcementCell")!
        
        
        
        if announcmentData.rideSelect == "Take"
        {
            var data:GiveRideAnouncement
            data = announcmentData.anouncementGiveRide[indexPath.row]
            cell.textLabel?.text = data.name
            cell.detailTextLabel?.text = data.endPoint
            
        }
            
        else
        {
            var data:TakeRideAnouncement
            data = announcmentData.anouncementTakeRide[indexPath.row]
            cell.textLabel?.text = data.name
            cell.detailTextLabel?.text = data.startPoint
        }
        

        return cell
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
