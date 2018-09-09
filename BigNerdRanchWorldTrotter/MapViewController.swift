//
//  MapViewController.swift
//  BigNerdRanchWorldTrotter
//
//  Created by 10.12 on 2018/9/1.
//  Copyright © 2018 10.12. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    // MARk： Properties
    var mapView: MKMapView!
    
    // MARK: Life cycle
    override func loadView() {
        // creat a map view
        mapView = MKMapView()
        
        // set it as *the* View of this viewController
        view = mapView
        
        // creat a segmentedControl View
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let segmentedControl = UISegmentedControl(items: [standardString, hybridString, satelliteString])
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        // .valueChanged
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(segControl:)) , for:UIControl.Event.valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        // add constraints to segmentedControl
        let safeArea = view.safeAreaLayoutGuide
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20)
        let margins = view.layoutMarginsGuide
        let leadingContraints = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingContraints = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        // active constraints
        topConstraint.isActive = true
        leadingContraints.isActive = true
        trailingContraints.isActive = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController load its view!")
    }
    @objc func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .hybrid
        case 2: mapView.mapType = .satellite
        default: break
        }
    }
}
