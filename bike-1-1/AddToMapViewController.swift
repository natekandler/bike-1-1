//
//  AddToMapViewController.swift
//  bike-1-1
//
//  Created by Apprentice on 6/14/14.
//  Copyright (c) 2014 Apprentice. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class AddToMapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var mapView : MKMapView

    @IBOutlet var descriptionField : UITextField
    let locationManager = CLLocationManager()
    
    var user_latitude = 0.00
    var user_longitude = 0.00
    var once = 1
    
    func locationManager(manager:CLLocationManager!, didUpdateLocations locations:AnyObject[]){
        if once == 1 {
            user_longitude = locations[0].coordinate.longitude
            user_latitude = locations[0].coordinate.latitude
            println("IN LM \(user_latitude)")
        }
        once += 1
    }
    
    
    @IBAction func doneButton(sender : AnyObject) {
        
        
//        var url = NSURL(string:"http://www.bike-1-1.com/events/")
        var url = NSURL(string:"http://localhost:3000/events/")

        
        var request = NSMutableURLRequest(URL: url)
        println(user_latitude)
        let string = NSString(format: "required_text=\(descriptionField)&latitude=\(user_latitude)&longitude=\(user_longitude)")
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
