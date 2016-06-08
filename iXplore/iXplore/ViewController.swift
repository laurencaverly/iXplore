//
//  ViewController.swift
//  iXplore
//
//  Created by Lauren Caverly on 6/8/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var spotList = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        spotList = Spot.spotList()
        self.setupMapView()
        self.setupTableView()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMapView() {
        self.mapView.mapType = .Standard
        self.mapView.showsBuildings = true
        self.mapView.addAnnotations(spotList as! [MKAnnotation])
        
    }
    
    func  setupTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
//        tableView.registerNib(UINib(nibName: "SpotTableViewCell", bundle: nil) forCellReuseIdentifier: "spotTableViewCell")
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spotList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let spot = spotList[row]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = spot.title!
        
        return cell
        
    }
    
    func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.mapView.setCenterCoordinate(spotList[indexPath.row].coordinate, animated: true)
        self.mapView.showAnnotations(spotList as! [MKAnnotation], animated: true)
        
    }
    
}

