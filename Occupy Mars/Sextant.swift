//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

import Foundation
import CoreLocation

//import SwiftAA

class Sextant: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var location: CLLocation?
    var heading: CLHeading?
    
    var locationInitializationCallback: (() -> Void)?
    var locationContinuousCallback: (() -> Void)?
    var headingInitializationCallback: (() -> Void)?
    var headingContinuousCallback: (() -> Void)?
    
    var hasUpdatedLocation = false
    var hasUpdatedHeading = false
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func setLocationContinuousCallbackFunction(_ function: @escaping () -> Void) {
        locationContinuousCallback = function
    }
    
    func setLocationInitializationCallbackFunction(_ function: @escaping () -> Void) {
        locationInitializationCallback = function
    }
    
    func setHeadingContinuousCallbackFunction(_ function: @escaping () -> Void) {
        headingContinuousCallback = function
    }
    
    func setHeadingInitializationCallbackFunction(_ function: @escaping () -> Void) {
        headingInitializationCallback = function
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationObj = locations.last else {
            print("location not found!")
            return
        }
        
        location = locationObj
        
        if(!hasUpdatedLocation) {
            if let let_callback = locationInitializationCallback {
                let_callback()
            }
            hasUpdatedLocation = true
        }
        
        if let let_callback = locationContinuousCallback {
            let_callback()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        heading = newHeading
        
        if(!hasUpdatedHeading) {
            if let let_callback = headingInitializationCallback {
                let_callback()
            }
            hasUpdatedHeading = true
        }
        
        if let let_callback = headingContinuousCallback {
            let_callback()
        }
    }

    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    manager.startUpdatingLocation()
                    manager.startUpdatingHeading()
                }
            }
        }
    }
}
