//
//  AddToMapViewController.swift
//  bike-1-1
//
//  Created by Apprentice on 6/14/14.
//  Copyright (c) 2014 Apprentice. All rights reserved.
//

import UIKit
import CoreLocation

class AddToMapViewController: UIViewController, CLLocationManagerDelegate {
    var latitude = 0.000
    var longitude = 0.000
    
    
    
    func get_latitude(user_latitude : Double){
        let latitude = user_latitude
    }
    
    func get_longitude(user_longitude : Double){
        longitude = user_longitude
    }
   

    @IBOutlet var descriptionField : UITextField
    let locationManager = CLLocationManager()
    @IBAction func doneButton(sender : AnyObject) {
        println(longitude)
        println(latitude)
        
        func get_longitude(user_longitude : Double){
            longitude = user_longitude
        }
        
//        var dataString = "{test}"
        
//        var jsonData = dataString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
//        
//        var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
//        
        
//        var urlPath = "http://www.bike-1-1.com/phones"
//        var url = NSURL(string: urlPath)
//        var request = NSMutableURLRequest(URL: url)
//        request.HTTPMethod = "POST"
//        
//        request.HTTPBody = jsonData
//        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
//        
//        
//        
//        connection.start()
//        println("jsonData \(jsonData)")
//        println("json \(json)")
        
        
        var url = NSURL(string:"http://localhost:3000/events/")
        var request = NSMutableURLRequest(URL: url)
        
        let string = NSString(format: "required_text=\(descriptionField)&latitude=42.4654634&longitude=105.342")
        let data = string.dataUsingEncoding(NSUTF8StringEncoding)
        
        request.HTTPMethod = "POST"
        request.HTTPBody = data
        
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        println("sending request...")
        
        connection.start()
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        

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
