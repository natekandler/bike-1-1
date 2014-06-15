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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    @lazy var data = NSMutableData()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startConnection()
    }
    
    
    func startConnection(){
        let urlPath: String = "http://www.bike-1-1.com/phones.json"
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    //        func btnLoad_Click(sender: UIButton){
    //            startConnection()
    //        }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println("json results")
        println(jsonResult)
    }
    
    
    func locationManager(manager:CLLocationManager!, didUpdateLocations locations:AnyObject[]){
//        println(locations[0].coordinate.latitude)
//        println(locations[0].coordinate.longitude)
        
        
        var addMapView = AddToMapViewController()
        addMapView.get_latitude(locations[0].coordinate.latitude)
        addMapView.get_longitude(locations[0].coordinate.longitude)
        
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
    
        
        var user_location_annotation = MKPointAnnotation()
        
        user_location_annotation.coordinate = user_location
        user_location_annotation.title = "You are here"
        
        self.mapView.addAnnotation(user_location_annotation)
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        println("Failed to update")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

