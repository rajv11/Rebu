//
//  SecondViewController.swift
//  Rebus
//
//  Created by Jennaikode,Vamshi Raj on 10/1/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DemoModel.data.userNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell  =  tableView.dequeueReusableCell(withIdentifier: "chatCell")!
        cell.textLabel?.text = DemoModel.data.userNames[indexPath.row]
        cell.detailTextLabel?.text = DemoModel.data.messages[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

