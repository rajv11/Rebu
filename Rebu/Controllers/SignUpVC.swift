//
//  SignUpVC.swift
//  Rebus
//
//  Created by student on 10/21/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var userIdTF: UITextField!
    @IBOutlet weak var emailIdTF: UITextField!
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var zipTF: UITextField!
    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    @IBAction func onDob(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dobTF.text = dateFormatter.string(from: sender.date)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func displayMyAlertMessage(userMessage: String)
    {
        let alert = UIAlertController(
            title: "Alert",
            message: userMessage,
            preferredStyle: .alert);
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
           // print("NO")
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func register_User(_ sender: Any) {
        if let fName = firstNameTF.text, let lName = lastNameTF.text, let userID = userIdTF.text, let email = emailIdTF.text, let dob = dobTF.text, let addressLine = addressTF.text, let city = cityTF.text, let state = stateTF.text, let zip = Int(zipTF.text!), let mobile = Int(mobileNumberTF.text!), let password = passwordTF.text, let confirmpassword = confirmPasswordTF.text
        {
            print("clicked")
            if (password != confirmpassword ) {
                displayMyAlertMessage(userMessage: "Passwords doesnot match")
                return
            }else{
                if ( !NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[0-9])[A-Za-z\\d$@$#!%*?&]{8,}").evaluate(with: password)) {
                    displayMyAlertMessage(userMessage: "Password should meet requirements")
                    return
                }
            }
            
            
            
            let address:Address = Address(firstLine: addressLine, city: city, state: state, zip: zip)
            let user:User = User(user_id: userID, firstName: fName,lastName: lName, email: email, password: password, mobile: mobile,dob: dob, address:address)
            
            UsersRepo.users.addUser(user)
            
            self.performSegue(withIdentifier: "Signup", sender: nil)
            
        }else{
            displayMyAlertMessage(userMessage: "Please Enter complete information")
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier == "Signup" ? false : true
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
