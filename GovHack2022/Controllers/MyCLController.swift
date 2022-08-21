//
//  MyCLController.swift
//
//  Created by Adam Balzan on 10/10/19.
//

import UIKit
import CoreLocation

class MyCLController: NSObject {

    @objc static var hasBeenStarted = false
    @objc static let shared = MyCLController()
    let locationManager = CLLocationManager()
    @objc var currentLocation: CLLocation?
    @objc var locationServicesDisabled = false
    @objc var locationServicesUnavailable = false
    var runWhenHaveLocation: (() -> Void)?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        start()
    }

    @objc func start() {
        MyCLController.hasBeenStarted = true
        locationManager.distanceFilter = 500
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startUpdatingLocation()
        if currentLocation != nil {
            //in the instance the location manager was stopped when it already had the current location and then restarted we want to reset the availability flags as the didUpdateLocations may not be called
            locationServicesDisabled = false
            locationServicesUnavailable = false
        }
        if !CLLocationManager.locationServicesEnabled() {
            locationServicesDisabled = true
        }
    }

    @objc func stop() {
        locationManager.stopUpdatingLocation()
    }
}

extension MyCLController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            start()
        default:
            stop()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationServicesDisabled = false
        locationServicesUnavailable = false
        self.currentLocation = locations.last
        if let action = runWhenHaveLocation {
            action()
            runWhenHaveLocation = nil
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let clErr = error as? CLError {
            switch clErr {
            case CLError.locationUnknown:
                locationServicesUnavailable = true
            case CLError.denied:
                locationServicesDisabled = true
            default:
                locationServicesUnavailable = true
            }
        }
        print("Error getting Location - ", error.localizedDescription)
    }
}
