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



class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView : MKMapView
    let locationManager = CLLocationManager()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()

    }
    
    
    func locationManager(manager:CLLocationManager!, didUpdateLocations locations:AnyObject[]){
        
        var addMapView = AddToMapViewController()
        addMapView.get_latitude(locations[0].coordinate.latitude)
        addMapView.get_longitude(locations[0].coordinate.longitude)
        
        mapView.scrollEnabled = true
        mapView.zoomEnabled = true
        
        var user_long = locations[0].coordinate.longitude
        var user_lat = locations[0].coordinate.latitude
        
        var latDelta:CLLocationDegrees = 0.5
        var longDelta:CLLocationDegrees = 0.5
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var user_location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(user_lat, user_long)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(user_location, span)
        
        self.mapView.setRegion(region, animated: true)
    
        
        var user_location_annotation = MKPointAnnotation()
        
        user_location_annotation.coordinate = user_location
        user_location_annotation.title = "You are here"
        
        
        
        let urlPath: String = "http://localhost:3000/phones.json"
        

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
        
        
        
        for jsonObject in parsedJSON {
            
            var thisObj = jsonObject as NSDictionary
            var marker_latitude = thisObj["latitude"] as Double
            var marker_longitude = thisObj["longitude"] as Double
            var request = thisObj["request_text"] as String
            
            var new_location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(marker_latitude, marker_longitude)
            var new_annotation = MKPointAnnotation()
   
            new_annotation.coordinate = new_location
            new_annotation.title = request
            
            self.mapView.addAnnotation(new_annotation)
            self.mapView.addAnnotation(user_location_annotation)
            
            count = count + 1
        }
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        println("Failed to update")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

