//
//  RegisterViewController.swift
//  Capture
//
//  Jerrod Kim
//  jiryangk@usc.edu
//  Created by Jerrod Kim on 12/12/19.
//  Copyright © 2019 Jerrod Kim. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // password shouldn't be too simple. causes an error
    @IBAction func registerButtonDidPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = pwTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) {
                authResult, error in
                if let err = error {
                    
                    self.showError(msg: "Something went wrong")
                    //                self.performSegue(withIdentifier: "loginScreen", sender: self)
                }
                else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func dismissTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func showError (msg: String) {
        let alertController = UIAlertController(title: "error",
                                                message: "error",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
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
