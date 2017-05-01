//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

import Foundation
import CoreLocation

enum Perturbations {
    case Sun
    case Moon
    case Jupiter
    case Saturn
    case Uranus
    case Pluto
}

class Sextant: NSObject {
    
     var a: Double,
         e: Double,
      //T1: Double,
         i: Double,
        N1: Double,
         w: Double,
        M1: Double,
         q: Double,
        Q1: Double,
        P1: Double,
         n: Double,
       //t: Double,
        L1: Double,
        E1: Double,
         v: Double,
         r: Double,
         m: Double,
         x: Double,
         y: Double,
       lon: Double,
        x1: Double,
        y1: Double,
        z1: Double,
    xequat: Double,
    yequat: Double,
    zequat: Double,
        r1: Double,
        RA: Double,
      Decl: Double,
     GMST0: Double,
longnitude: Double,
  latitude: Double,
   SIDTIME: Double,
        HA: Double,
        x2: Double,
        y2: Double,
        z2: Double,
      xhor: Double,
      yhor: Double,
      zhor: Double,
   azimuth: Double,
  altitude: Double,
      sinh: Double,
         h: Double,
   noon_RA: Double,
UT_Sun_in_south: Double,
    cosLHA: Double,
       LHA: Double,
    sunset: Double,
   sunrise: Double
    
    init(p: Planet) {
        self.a = p.a!
        self.e = p.e!
        //self.T1 = p.T!
        self.i = p.i!
        self.N1 = p.N!
        self.w = p.w!
        self.m = p.m!
        self.M1 = p.M1!
        q = a * (1 - e)
        Q1 = a * (1 + e)
        P1 = 365.256898326 * pow(a, 1.5 / sqrt(1 + m))
        n = 360 / P1
        
        //TODO, (maybe unneeded)
        //t =
        M1 = M1 - floor(M1/360)*360
        L1 = (M1 + w + N1).truncatingRemainder(dividingBy: 360.0)
        
        E1 = M1 + ((180.0 / Double.pi) * e * __sinpi(M1 / 180.0) * (1.0 + (e * __cospi(M1 / 180.0))))
        //let E = M1 + e * (180 / Double.pi) * sin(M1) * ( 1.0 + e * cos(M1) ) //degrees
        // E = M + e * sin(M) * ( 1.0 + e * cos(M) ) //for radians
        //var E0 = E
        //E1 = E0 - ( E0 - e*(180/Double.pi) * sin(E0) - M1 ) / ( 1 - e * cos(E0) )
        //E1 = E0 - ( E0 - e * sin(E0) - M ) / ( 1 - e * cos(E0) )
        //var iterations = 100
        //while (abs(E0-E1)>0.001 && iterations > 0) {
        //   iterations -= 1
        //    E0 = E1
        //    E1 = E0 - ( E0 - e*(180/Double.pi) * sin(E0) - M1 ) / ( 1 - e * cos(E0) )
        //}
        
        x = __cospi(E1 / 180.0) - e
        y = __sinpi(E1 / 180.0) * sqrt(1 - e * e)
        
        r = sqrt(x * x + y * y)
        v = atan2(y / 180.0, x / 180.0) * (180.0 / Double.pi)
        
        lon = v + w
        lon = lon.truncatingRemainder(dividingBy: 360.0)
        
        x1 = r * __cospi(lon / 180.0)
        y1 = r * __sinpi(lon / 180.0)
        z1 = 0.0
        
        xequat = x1
        yequat = y1 * __cospi(23.4406 / 180.0) - z1 * __sinpi(23.4406 / 180.0)
        zequat = y1 * __sinpi(23.4406 / 180.0) + z1 * __cospi(23.4406 / 180.0)
        
        r1 = sqrt(xequat * xequat + yequat * yequat + zequat * zequat)
        RA = atan2(yequat / 180.0, xequat / 180.0) * (180.0 / Double.pi)
        Decl = atan2(zequat / 180, sqrt(xequat * xequat + yequat * yequat) / 180) * (180.0 / Double.pi)
        
        let locationManager = CLLocationManager()
        //locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        //longnitude = (locationManager.location?.coordinate.longitude)!
        
        //TESTING ONLY, DELETE THIS LATER
        //longnitude = 123.55
        //latitude = 37.24
        longnitude = 15
        latitude = 15
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        //let currentTime = Date()
        let currentTime = formatter.date(from: "1990/4/19 00:00")
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour], from: currentTime!)
        let year = dateComponents.year!
        let month = dateComponents.month!
        let day = dateComponents.day!
        let hour = dateComponents.hour!
        
        GMST0 = (L1) / 15.0 + 12.0
        SIDTIME = GMST0 + Double(hour) + longnitude / 15
        SIDTIME = abs(SIDTIME).truncatingRemainder(dividingBy: 24.0)
        HA = SIDTIME - (RA / 15)
        
        x2 = __cospi(HA / 180.0) * __cospi(Decl / 180.0)
        y2 = __sinpi(HA / 180.0) * __sinpi(Decl / 180.0)
        z2 = __sinpi(Decl / 180.0)
        
        xhor = x2 * __sinpi(longnitude) - z2 * __cospi(longnitude)
        yhor = y2
        zhor = z2 * __cospi(longnitude) + z2 * __sinpi(longnitude)
        
        azimuth = atan2(yhor / 180, xhor / 180) + 180
        altitude = asin(zhor / 180)
    
        sinh = __sinpi(latitude / 180) * __sinpi(Decl / 180) + __cospi(latitude / 180) * __cospi(Decl / 180) * __cospi(HA / 180)
        h = asin(sinh / 180)
        
        noon_RA = GMST0 + 12.0 + longnitude / 15
        UT_Sun_in_south = (noon_RA - GMST0 - longnitude) / 15.0
        cosLHA = (sinh - __sinpi(latitude / 180) * __sinpi(Decl / 180)) / (__cospi(latitude / 180) * __cospi(Decl / 180))
        
        if cosLHA > 1.0 {
            LHA = Double.infinity
        } else if cosLHA < -1.0 { //midnight sunbath
            LHA = -Double.infinity
        } else {
            LHA = acos(cosLHA / 180) / 15.0
        }
        sunset = UT_Sun_in_south + LHA
        sunrise = UT_Sun_in_south - LHA
        
        //convert UT to local time
    }
    
    func sin(degrees: Double) -> Double {
        return __sinpi(degrees / 180.0)
    }
    
    
    func cos(degrees: Double) -> Double {
        return __cospi(degrees / 180.0)
    }
    
    func rev(x: Double) -> Double {
        return x - floor(x/360)*360
    }
    
    func getPosition() {
        print("===================")
        print(w) //good
        print(a) //good
        print(e) //good
        print(M1) //good
        print(M1) //good
        print(N1) //good
        print(L1)  //good
        print("-------E HERE -------")
        print(E1) //good
        print(x) //good
        print(y) //good
        print(r) //good
        print(v) //good
        print(lon) //good
        print("-----x1 y1 z1 HERE--------")
        print(x1) //good
        print(y1) //off by a tiny amount
        print(z1) //good
        print(xequat) //good
        print(yequat) //off by a tiny amount
        print(zequat) //good
        print(r1) //good
        print(RA) //good
        print(Decl) //good
        print("------TIMES HERE----------")
        print(GMST0) //good
        print(longnitude) //good
        print(SIDTIME) //good
        print(HA)
        print(x2)
        print(y2)
        print(z2) //good
        print("----xhor,yhor,zhor------")
        print(xhor)
        print(yhor)
        print(zhor)
        print(azimuth)
        print(altitude)
        print("---Position for times---")
        print(sinh)
        print(h)
        print(noon_RA)
        print(UT_Sun_in_south)
        print(cosLHA)
        print(LHA)
        print(sunrise)
        print(sunset)
        print("===================")
    }
    
    //TODO: PERTUBATIONS OF MOON, SUN, JUPITER, SATURN, AND URANUS, The Moon's topocentric position, PLUTO,  The elongation and physical ephemerides of the planets
//    var N: Double,
//    i: Double,
//    w: Double,
//    a: Double,
//    e: Double,
//    M: Double,
//    w1: Double,
//    L: Double,
//    q: Double,
//    bigQ: Double,
//    P: Double
//    
//    var perturbation: Perturbations?
    
//    init(N: Double, i: Double, w: Double, a: Double, e: Double, M: Double, perturbation: Perturbations? = nil) {
//        self.N = abs(N).truncatingRemainder(dividingBy: 360)
//        self.i = i
//        self.w = abs(w).truncatingRemainder(dividingBy: 360)
//        self.a = a
//        self.e = e
//        self.M = abs(M).truncatingRemainder(dividingBy: 360)
//        
//        self.w1 = N + w
//        self.L = M + w1
//        self.q = a*(1-e)
//        self.bigQ = a*(1+e)
//        self.P = pow(a, 1.5)
//        
//        if perturbation != nil {
//            self.perturbation = perturbation
//        }
//    }
    
    //THIS METHOD IS FUCKED
    // func getSideralTime(v: Double) -> Double {
    //     let Ls = v + w
    //     let GMST0 = (Ls + 180)/15 = Ls/15 + 12
    //     let GMST = GMST0 + UT
    //     return GMST + local_longitude/15
    // }
    
//    func getPosition() {
//        
//        let d = formattedTimeSinceEpoch()
//        
//        let ecl = 23.4393 - 3.563E-7 * Double(d)
//        let E = M1 + e*(180/Double.pi) * sin(M1) * ( 1.0 + e * cos(M) ) //degrees
//        // E = M + e * sin(M) * ( 1.0 + e * cos(M) ) //for radians
//        
//        var E0 = E
//        var E1 = E0 - ( E0 - e*(180/Double.pi) * sin(E0) - M1 ) / ( 1 - e * cos(E0) )
//        //E1 = E0 - ( E0 - e * sin(E0) - M ) / ( 1 - e * cos(E0) )
//        var iterations = 100
//        while (abs(E0-E1)>0.001 && iterations > 0) {
//            iterations -= 1
//            E0 = E1
//            E1 = E0 - ( E0 - e*(180/Double.pi) * sin(E0) - M1 ) / ( 1 - e * cos(E0) )
//        }
//        
//        let xv = a * ( cos(E) - e )
//        let yv = a * ( sqrt(1.0 - e*e) * sin(E) )
//        
//        let v = atan2( yv, xv )
//        let r = sqrt( xv*xv + yv*yv )
//        
//        //position in 3d space
//        let xh = r * ( cos(N1) * cos(v+w) - sin(N1) * sin(v+w) * cos(i) )
//        let yh = r * ( sin(N1) * cos(v+w) + cos(N1) * sin(v+w) * cos(i) )
//        let zh = r * ( sin(v+w) * sin(i) )
//        
//        //these 2 should be approximately equal (UPDATE: I'm retarded)
//        print(sqrt(xh*xh+yh*yh+zh*zh))
//        print(r)
//        
//    }
    
    
    
    // time calculations
    
    func formattedTimeSinceEpoch() -> Int { //y, m, d,
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let epochTime = formatter.date(from: "2000/1/01 00:00")
        
        //let currentTime = Date()
        let currentTime = formatter.date(from: "1990/4/19 00:00")
        
        let y = Calendar.current.dateComponents([.year], from: epochTime!, to: currentTime!).year!
        let m = Calendar.current.dateComponents([.month], from: epochTime!, to: currentTime!).month!
        let D = Calendar.current.dateComponents([.day], from: epochTime!, to: currentTime!).day!
        let h = Calendar.current.dateComponents([.hour], from: epochTime!, to: currentTime!).hour!
        
        return 367 * y - 7 * Int((y + Int((m + 9) / 12)) / 4) + Int(275 * m / 9) + D - 730530 + h / 24
    }
}

//print(formattedTimeSinceEpoch())

//components.day
//var d = 367*y - 7 * ( y + (m+9)/12 ) / 4 + 275*m/9 + D - 730530
//getPosition()
