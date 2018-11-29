//
//  PostAnouncementViewController.swift
//  Rebu
//
//  Created by SANTOSH SEKHAR M B on 11/26/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class PostAnouncementViewController: UIViewController {
    @IBOutlet weak var anounceNameTXT: UITextField!
    

    @IBOutlet weak var startPointTXT: UITextField!
    
    @IBOutlet weak var endPointTXT: UITextField!
    
    @IBOutlet weak var contactTXT: UITextField!
    
    @IBOutlet weak var extraInfoTXT: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func postAnouncement(_ sender: Any) {
        if let name = anounceNameTXT.text, let startPoint = startPointTXT.text, let endPoint = endPointTXT.text , let contact = contactTXT.text, let extraInfo = extraInfoTXT.text
            
        {
            //var data:Anouncement
            
            if Anouncements.anounce.rideSelect == "Take"
            {
//            Anouncements.anounce.addGiveAnouncement(x: Anouncement(name: name, startPoint: startPoint, endPoint: endPoint, contact: contact, extra: extraInfo))
//        }
            Anouncements.anounce.saveTakeRideAnouncements(name: name, startPoint: startPoint, endPoint: endPoint, contact: contact, extra: extraInfo)
            
        }
            
    else

        {
            Anouncements.anounce.saveGiveRideAnouncements(name: name, startPoint: startPoint, endPoint: endPoint, contact: contact, extra: extraInfo)
        }
    }
    
    
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
