//
//  LoginViewController.swift
//  Capture
//
//  Created by Jerrod Kim on 12/12/19.
//  Copyright © 2019 Jerrod Kim. All rights reserved.
//
//  Jerrod Kim
//  jiryangk@usc.edu

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    

    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonDidPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = pwTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                //self?.transitionToHome()
                //
                guard let thisVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as? UITabBarController else { return }
                self?.view.window?.rootViewController = thisVC
                self?.view.window?.makeKeyAndVisible()
                //self?.show(thisVC,sender: self)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
//
//    func transitionToHome() {
//        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//        let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "homeVC") as! ViewController
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = redViewController
//
//
//        self.performSegue(withIdentifier: "homeVC", sender: self)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
