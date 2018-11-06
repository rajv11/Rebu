//
//  ProfileViewController.swift
//  Rebu
//
//  Created by Kelsie Dibben on 11/5/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var user:User!
    
    @IBOutlet weak var firstNameLBL: UILabel!
    
    @IBOutlet weak var lastNameLBL: UILabel!
    
    @IBOutlet weak var emailLBL: UILabel!
    
    @IBOutlet weak var phoneLBL: UILabel!
    
    @IBOutlet weak var addressLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        firstNameLBL.text = user.firstName
        lastNameLBL.text = user.lastName
        emailLBL.text = user.email
        phoneLBL.text = String(user.mobile)
        addressLBL.text = "\(user.address.firstLine) \n\(user.address.city) \(user.address.state) \(user.address.zip)"
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
