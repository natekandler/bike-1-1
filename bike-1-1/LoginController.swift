//
//  LoginController.swift
//  bike-1-1
//
//  Created by Apprentice on 6/17/14.
//  Copyright (c) 2014 Apprentice. All rights reserved.
//
import UIKit
import Foundation

class LoginController: UIViewController, NSURLConnectionDelegate, NSURLConnectionDataDelegate {

    @IBOutlet var emailField : UITextField

    @IBOutlet var passwordField : UITextField

    @IBOutlet var loginLabel : UILabel
    
//    @IBAction func loginButton(sender : AnyObject) {
//    
//    }
//}

    
    var data = NSMutableData()
    
    
    @IBAction func loginButton(sender : AnyObject) {
        post_user_details()
    }
    
    func post_user_details() {
        var url = NSURL(string:"http://localhost:3000/phones/login")
        
        var request = NSMutableURLRequest(URL: url)
        
        let string = NSString(format: "email=\(emailField.text)&password=\(passwordField.text)")
        let data = string.dataUsingEncoding(NSUTF8StringEncoding)
        
        println("\(emailField.text), \(passwordField.text)")
        
        request.HTTPMethod = "POST"
        request.HTTPBody = data
        
        println("sending request...")
    

//
//            NSUserDefaults.standardUserDefaults().setObject(auth_token, forKey: "auth_token")
//            request.setValue("text/xml", forHTTPHeaderField: "X-Requested-With")
//        NSUserDefaults.standardUserDefaults().stringForKey("auth_token")
//            request.addValue("token \(auth_token)", forHTTPHeaderField: "Authorization")
        
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        

        connection.start()
        
        
        
//            NSUserDefaults.standardUserDefaults.stringForKey('auth_token')
//            NSUserDefaults.standardUserDefaults.setObject(nil, forKey: 'auth_token')
    }
    


    func connection(connection: NSURLConnection!, didReceiveData data:NSData!) {
        self.data.appendData(data)
        println("data \(data)")
    }
  
    
    func connectionDidFinishLoading(connection: NSURLConnection!){
        var error: NSError?
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println(jsonResult)
        
        var auth_token = jsonResult["token"] as String
        println("JSON result: \(auth_token)")
        
        if auth_token == "Unauthorized"{
            println("break")
            self.performSegueWithIdentifier("login", sender: self)
        }
        
        NSUserDefaults.standardUserDefaults().setObject(auth_token, forKey: "auth_token")
//        var test = NSUserDefaults.standardUserDefaults().stringForKey("auth_token")
//        println(test)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!){
        if segue.identifier == "login" {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    


}



