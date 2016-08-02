//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by jyotishankar sahoo on 02/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController : UIViewController,MKMapViewDelegate {
    
    var mapView : MKMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map View loaded")

    }
    
    override func loadView() {
        super.loadView()
        
        //create mapview
        mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        mapView?.delegate = self
        //Set it to the viewcontroller's view
        view = mapView
        mapView?.showsUserLocation = true
        
        //create segment view
        let segmentView = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        segmentView.backgroundColor = UIColor.whiteColor()
        segmentView.selectedSegmentIndex = 0
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        //Add target
        segmentView.addTarget(self, action: #selector(MapViewController.updateMapStyle(_:)), forControlEvents: .ValueChanged)
        //add to view
        view.addSubview(segmentView)
        
        //Define Anchors
        let topConstraint = segmentView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let trailingConstraint = segmentView.trailingAnchor.constraintEqualToAnchor(view.layoutMarginsGuide.trailingAnchor)
        let leadingConstraint = segmentView.leadingAnchor.constraintEqualToAnchor(view.layoutMarginsGuide.leadingAnchor)
        
        //Active Constraints
        topConstraint.active = true
        trailingConstraint.active = true
        leadingConstraint.active = true
        
    }
    
    func updateMapStyle (segControl : UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            self.mapView?.mapType = .Standard
        case 1:
            self.mapView?.mapType = .Hybrid
        case 2:
            self.mapView?.mapType = .Satellite
        default:
            fatalError("Invalide selection index")
        }
    }
}