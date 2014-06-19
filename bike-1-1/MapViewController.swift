//
//  ViewController.swift
//  bike-1-1
//
//  Created by Apprentice on 6/14/14.
//  Copyright (c) 2014 Apprentice. All rights reserved.
//

import UIKit
import Foundation
import MapKit
import CoreLocation
import CoreGraphics



class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    

    @IBOutlet var mapView : MKMapView
    let locationManager = CLLocationManager()
    var current_parsed = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    
        
    }
    
    func locationManager(manager:CLLocationManager!, didUpdateLocations locations:AnyObject[]){        
        
        mapView.scrollEnabled = true
        mapView.zoomEnabled = true
        
        var user_long = locations[0].coordinate.longitude
        var user_lat = locations[0].coordinate.latitude
        
        var latDelta:CLLocationDegrees = 0.05
        var longDelta:CLLocationDegrees = 0.05
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var user_location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(user_lat, user_long)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(user_location, span)
        
        self.mapView.setRegion(region, animated: true)
        
        get_markers()
    
        
    }
    
    func get_markers() {
        
        let urlPath: String = "http://localhost:3000/phones.json"
//        let urlPath: String = "http://www.bike-1-1.com/phones.json"
        
        
        func getJSON(urlToRequest: String) -> NSData{
            return NSData(contentsOfURL: NSURL(string:urlToRequest))
            
        }
        
        func parseJSON(inputData: NSData) -> NSMutableArray{
            var error: NSError?
            var boardsDictionary: NSMutableArray = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSMutableArray
           
            return boardsDictionary
        }
        
        var rawJSON = getJSON(urlPath)
        
        var parsedJSON = parseJSON(rawJSON)
        
        if current_parsed != parsedJSON {
            current_parsed = parsedJSON
            
            for jsonObject in parsedJSON {
                var thisObj = jsonObject as NSDictionary
                if (thisObj["latitude"] != nil && thisObj["longitude"] != nil) {
                    var marker_latitude = thisObj["latitude"] as Double
                    var marker_longitude = thisObj["longitude"] as Double
                    var request = thisObj["request_text"] as String
                    
                    var annotationView : MKAnnotationView = MKAnnotationView()
                    
                    
                    var new_location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(marker_latitude, marker_longitude)
                    var new_annotation = MKPointAnnotation()
                    
                    new_annotation.coordinate = new_location
                    new_annotation.title = request
                    new_annotation.subtitle = "Help this user!"
                    
                    self.mapView.addAnnotation(new_annotation)
                    //                    self.mapView.addAnnotation(user_location_annotation)
                }
                
            }
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        println("Failed to update")
        get_markers()
        
        var user_lat = 41.889790
        var user_long = -87.639205
        
        var latDelta:CLLocationDegrees = 0.05
        var longDelta:CLLocationDegrees = 0.05
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var user_location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(user_lat, user_long)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(user_location, span)
        
        self.mapView.setRegion(region, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

