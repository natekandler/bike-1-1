//
//  LogInViewController.swift
//  bike-1-1
//
//  Created by Nate Kandler on 6/16/14.
//  Copyright (c) 2014 Apprentice. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var loginLabel : UILabel
    
    @IBOutlet var emailField : UITextField
    
    @IBOutlet var passwordField : UITextField
    
    @IBAction func loginButton(sender : AnyObject) {
        if emailField.text == "natekandler@gmail.com" && passwordField.text == "password" {
            self.performSegueWithIdentifier("toMapView", sender: self)
        }
        
        else {
            self.performSegueWithIdentifier("toMapView", sender: self)
            
            loginLabel.text = "email or password is incorrect"
            loginLabel.textColor = UIColor.redColor()
            emailField.resignFirstResponder()
            passwordField.resignFirstResponder()
        
        }
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
