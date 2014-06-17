//
//  LoginController.swift
//  bike-1-1
//
//  Created by Apprentice on 6/17/14.
//  Copyright (c) 2014 Apprentice. All rights reserved.
//
import UIKit

class LoginController: UIViewController {
    @IBOutlet var emailField : UITextField

    @IBOutlet var passwordField : UITextField

    @IBOutlet var loginLabel : UILabel

    @IBAction func loginButton(sender : AnyObject) {
        post_user_details()
//        if emailField.text == "natekandler@gmail.com" && passwordField.text == "password"{self.performSegueWithIdentifier("toMapView", sender: self)
//            
//            println("what are you doing here")}
//        
//        else {
////            loginLabel.text = "email or password is incorrect"
////            loginLabel.textColor = UIColor.redColor()
////            emailField.resignFirstResponder()
////            passwordField.resignFirstResponder()
//        }
        
    
    }
    
    func post_user_details() {
        var url = NSURL(string:"http://localhost:3000/login/")
        
        var request = NSMutableURLRequest(URL: url)
        
        let string = NSString(format: "email=''&email=\(emailField.text)&password=\(passwordField.text)")
        let data = string.dataUsingEncoding(NSUTF8StringEncoding)
        
        request.HTTPMethod = "POST"
        request.HTTPBody = data
        
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        println("sending request...")
        
        connection.start()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    


}



