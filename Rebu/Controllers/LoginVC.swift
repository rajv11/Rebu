//
//  LoginVC.swift
//  Rebus
//
//  Created by student on 10/21/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    func display(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func loginBtn(_ sender: Any) {
        if let userName = userNameTF.text , let password = passwordTF.text, !userName.isEmpty, !password.isEmpty {
            if !UsersRepo.users.isValid(userId: userName, password: password) {
                display(title: "Wrong details", msg: "Please enter correct ID and password")
            }
        } else {
            display(title: "Invalid Details", msg: "Please enter valid details")
        }
    }
    
    @IBAction func cancelSignUp(segue: UIStoryboardSegue)
    {
        
    }
    @IBAction func register(segue: UIStoryboardSegue)
    {
        self.reloadInputViews()
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
