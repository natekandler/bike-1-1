//
//  AddToMapViewController.swift
//  bike-1-1
//
//  Created by Apprentice on 6/14/14.
//  Copyright (c) 2014 Apprentice. All rights reserved.
//

import UIKit


class AddToMapViewController: UIViewController {

    @IBOutlet var descriptionField : UITextField

    @IBAction func doneButton(sender : AnyObject) {
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
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let map = MapViewController()
    
    

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
