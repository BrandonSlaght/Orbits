//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

import Foundation

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
        m: Double
    
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
        
        var x = __cospi(E1 / 180.0) - e
        var y = __sinpi(E1 / 180.0) * sqrt(1 - e * e)
        
        r = sqrt(x * x + y * y)
        v = atan2(y, x)
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
        M1 = rev(x: M1)
        print(M1) //good
        print(N1) //good
        print(M1 + w + N1) //good
        print(370.0.truncatingRemainder(dividingBy: 360.0)) //good
        print((M1 + w + N1).truncatingRemainder(dividingBy: 360.0)) //good
        print(L1)  //good
        print("-------E HERE -------")
        print(E1) //good
        var lon = v + w
        print(cos(degrees: E1) - e) //good
        print(sin(degrees: E1) * sqrt(1 - e * e)) //good
        print(r) //good
        print(v)
        print(lon)
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
