//
//  ViewController.swift
//  map_test2
//
//  Created by Jared Daugherty on 6/12/14.
//  Copyright (c) 2014 Jared Daugherty. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
                            
    @IBOutlet var theMapView : MKMapView
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var latitude:CLLocationDegrees  = 41.889883
        var longitude:CLLocationDegrees = -87.637614
        
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var dbc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var theRegion:MKCoordinateRegion = MKCoordinateRegionMake(dbc, theSpan)
        
        self.theMapView.setRegion(theRegion, animated: true)
        
        var dbcAnnotation = MKPointAnnotation()
        
        dbcAnnotation.coordinate = dbc
        
        dbcAnnotation.title = "You are here"
        dbcAnnotation.subtitle = "Just kidding this is hardcoded."
        
        self.theMapView.addAnnotation(dbcAnnotation)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

