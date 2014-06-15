//
//  ViewController.swift
//  map_test2
//
//  Created by Jared Daugherty on 6/12/14.
//  Copyright (c) 2014 Jared Daugherty. All rights reserved.
//

import UIKit
import Foundation
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var theMapView : MKMapView
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()

    
    }
    
    func locationManager(manager:CLLocationManager!, didUpdateLocations locations:AnyObject[]) {
        println(locations[0].coordinate.longitude)
        println(locations[0].coordinate.latitude)
        
        theMapView.scrollEnabled = true
        theMapView.zoomEnabled = true
    
        
        var user_long = locations[0].coordinate.longitude
        var user_lat = locations[0].coordinate.latitude
        
        var latDelta:CLLocationDegrees = 0.3
        var longDelta:CLLocationDegrees = 0.3
        
        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var user_location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(user_lat, user_long)
        
        var theRegion:MKCoordinateRegion = MKCoordinateRegionMake(user_location, theSpan)
        
        self.theMapView.setRegion(theRegion, animated: true)
        
        var user_location_annotation = MKPointAnnotation()
        
        user_location_annotation.coordinate = user_location
        user_location_annotation.title = "You are here"
//        user_location_annotation.subtitle = ""
        
        self.theMapView.addAnnotation(user_location_annotation)
        
        
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

