//
//  ViewController.swift
//  map_test2
//
//  Created by Jared Daugherty on 6/12/14.
//  Copyright (c) 2014 Jared Daugherty. All rights reserved.
//

import UIKit
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

//        var latitude:CLLocationDegrees  = 41.889883
//        var longitude:CLLocationDegrees = -87.637614
//        
//        var latDelta:CLLocationDegrees = 0.01
//        var longDelta:CLLocationDegrees = 0.01
//        
//        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
//        
//        var dbc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//        
//        var theRegion:MKCoordinateRegion = MKCoordinateRegionMake(dbc, theSpan)
//
//        self.theMapView.setRegion(theRegion, animated: true)
//        
//        var dbcAnnotation = MKPointAnnotation()
//        
//        dbcAnnotation.coordinate = dbc
//        
//        dbcAnnotation.title = "You are here"
//        dbcAnnotation.subtitle = "Just kidding this is hardcoded."
//        
//        self.theMapView.addAnnotation(dbcAnnotation)
    
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:AnyObject[]) {
        println(locations[0].coordinate.longitude)
        println(locations[0].coordinate.latitude)
        
        var user_long = locations[0].coordinate.longitude
        var user_lat = locations[0].coordinate.latitude
        
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var user_location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(user_lat, user_long)
        
        var theRegion:MKCoordinateRegion = MKCoordinateRegionMake(user_location, theSpan)
        
        self.theMapView.setRegion(theRegion, animated: true)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

