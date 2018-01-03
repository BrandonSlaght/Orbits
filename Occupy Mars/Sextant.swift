//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

import Foundation
import CoreLocation

import SwiftAA

class Sextant: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var location: CLLocation?
    //typealias Func =
    var callback: (() -> Void)?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //let earth = Earth(julianDay: JulianDay(year: 2000, month: 2, day: 1))
    }
    
    func setCallbackFunction(_ function: @escaping () -> Void) {
        callback = function
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationObj = locations.last else{
            print("location not found!")
            return
        }
        
        location = locationObj
        
        let coord = locationObj.coordinate
        print(coord.latitude)
        print(coord.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    manager.requestLocation()
                    callback!()
                }
            }
        }
    }
    
    func getRiseSetTransitTimesByPlanet(planet: String, date: Date, location: CLLocation) -> RiseTransitSetTimes? {
        let coords = GeographicCoordinates.init(location)
        guard let planet = getCelestialBodyByName(planet: planet, date: date) else {
            print("planet does not exist :( ")
            return nil
        }
        return planet.riseTransitSetTimes(for: coords)
    }
    
    func getCelestialBodyByName(planet: String, date: Date) -> CelestialBody? {
        var planetObject: CelestialBody
        let julianDate = JulianDay(date)
        
        switch planet {
        case "Mercury":
            planetObject = Mercury.init(julianDay: julianDate, highPrecision: true)
        case "Venus":
            planetObject = Venus.init(julianDay: julianDate, highPrecision: true)
        case "Mars":
            planetObject = Mars.init(julianDay: julianDate, highPrecision: true)
        case "Jupiter":
            planetObject = Jupiter.init(julianDay: julianDate, highPrecision: true)
        case "Saturn":
            planetObject = Saturn.init(julianDay: julianDate, highPrecision: true)
        case "Uranus":
            planetObject = Uranus.init(julianDay: julianDate, highPrecision: true)
        case "Neptune":
            planetObject = Neptune.init(julianDay: julianDate, highPrecision: true)
        default:
            return nil
        }
        
        return planetObject
    }
}
