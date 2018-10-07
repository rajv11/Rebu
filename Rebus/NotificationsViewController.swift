//
//  NotificationsViewController.swift
//  Rebus
//
//  Created by Muchkur Bogarajula,Santosh Sekhar on 10/7/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return DemoModel.data.notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell  =  tableView.dequeueReusableCell(withIdentifier: "notificationCell")!
        cell.textLabel?.text = DemoModel.data.notifications[indexPath.row]
        
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
