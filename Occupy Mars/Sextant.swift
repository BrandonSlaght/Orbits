//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

import Foundation
import CoreLocation

import SwiftAA

class Sextant: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var location: CLLocation?
    var callback: (() -> Void)?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func setCallbackFunction(_ function: @escaping () -> Void) {
        callback = function
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
        
        let coord = locationObj.coordinate
        print(coord.latitude)
        print(coord.longitude)
        
        callback!()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    manager.requestLocation()
                    manager.startUpdatingHeading()
                }
            }
        }
    }
}
