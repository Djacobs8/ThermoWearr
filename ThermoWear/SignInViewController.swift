//
//  SignInViewController.swift
//  ThermoWear
//
//  Created by Derek Jacobs on 2017-04-05.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func signinTapped(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("We have an error")
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("We have an error")
                    } else {
                        print("We created a user")
                        self.performSegue(withIdentifier: "signinSegue", sender: nil)
                    }
                })
            } else {
                print ("Signed in successfully")
                self.performSegue(withIdentifier: "signinSegue", sender: nil)
            }
        })
    }
    
    
}

