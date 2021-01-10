//
//  LocationService.swift
//  Park.ly
//
//  Created by Jody Abney on 7/16/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import CoreLocation
import Foundation

protocol CustomUserLocDelegate {
    func userLocationUpdated(location: CLLocation)
}

class LocationService: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    static let shared = LocationService()
    
    var customUserLocDelegate: CustomUserLocDelegate?
    
    var locationManager = CLLocationManager()
    
    @Published var status = CLAuthorizationStatus.notDetermined
    @Published var currentLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.activityType = .other        
    }
    
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        let status = manager.authorizationStatus
        
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        case .denied, .restricted:
            manager.stopUpdatingLocation()
        @unknown default:
            fatalError("Unknown location status returned")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.currentLocation = location.coordinate
        }
    }
    
    
    
    // check for location authorization
    func checkLocationAuthStatus(_ manager: CLLocationManager) {
        if manager.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse {
            print("location authorized")
        } else {
            LocationService.shared.locationManager.requestWhenInUseAuthorization()
            print("location authorization requested")
        }
    }
}


