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

class sextant: NSObject {
    //TODO: PERTUBATIONS OF MOON, SUN, JUPITER, SATURN, AND URANUS, The Moon's topocentric position, PLUTO,  The elongation and physical ephemerides of the planets
    var N: Double,
    i: Double,
    w: Double,
    a: Double,
    e: Double,
    M: Double,
    w1: Double,
    L: Double,
    q: Double,
    bigQ: Double,
    P: Double
    
    var perturbation: Perturbations?
    
    init(Na: Double, i: Double, wa: Double, a: Double, e: Double, Ma: Double, perturbation: Perturbations? = nil) {
        self.N = abs(Na).truncatingRemainder(dividingBy: 360)
        self.i = i
        self.w = abs(wa).truncatingRemainder(dividingBy: 360)
        self.a = a
        self.e = e
        self.M = abs(Ma).truncatingRemainder(dividingBy: 360)
        
        self.w1 = N + w
        self.L = M + w1
        self.q = a*(1-e)
        self.bigQ = a*(1+e)
        self.P = pow(a, 1.5)
        
        if perturbation != nil {
            self.perturbation = perturbation
        }
    }
    
    //THIS METHOD IS FUCKED
    // func getSideralTime(v: Double) -> Double {
    //     let Ls = v + w
    //     let GMST0 = (Ls + 180)/15 = Ls/15 + 12
    //     let GMST = GMST0 + UT
    //     return GMST + local_longitude/15
    // }
    
    func getPosition() {
        
        let d = formattedTimeSinceEpoch()
        
        let ecl = 23.4393 - 3.563E-7 * Double(d)
        let E = M + e*(180/Double.pi) * sin(M) * ( 1.0 + e * cos(M) ) //degrees
        // E = M + e * sin(M) * ( 1.0 + e * cos(M) ) //for radians
        
        var E0 = E
        var E1 = E0 - ( E0 - e*(180/Double.pi) * sin(E0) - M ) / ( 1 - e * cos(E0) )
        //E1 = E0 - ( E0 - e * sin(E0) - M ) / ( 1 - e * cos(E0) )
        var iterations = 100
        while (abs(E0-E1)>0.001 && iterations > 0) {
            iterations -= 1
            E0 = E1
            E1 = E0 - ( E0 - e*(180/Double.pi) * sin(E0) - M ) / ( 1 - e * cos(E0) )
        }
        
        let xv = a * ( cos(E) - e )
        let yv = a * ( sqrt(1.0 - e*e) * sin(E) )
        
        let v = atan2( yv, xv )
        let r = sqrt( xv*xv + yv*yv )
        
        //position in 3d space
        let xh = r * ( cos(N) * cos(v+w) - sin(N) * sin(v+w) * cos(i) )
        let yh = r * ( sin(N) * cos(v+w) + cos(N) * sin(v+w) * cos(i) )
        let zh = r * ( sin(v+w) * sin(i) )
        
        //these 2 should be approximately equal (UPDATE: I'm retarded)
        print(sqrt(xh*xh+yh*yh+zh*zh))
        print(r)
        
    }
    
    
    
    // time calculations
    
    func formattedTimeSinceEpoch() -> Int { //y, m, d,
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let epochTime = formatter.date(from: "2000/1/01 00:00")
        
        let currentTime = Date()
        
        let y = Calendar.current.dateComponents([.year], from: epochTime!, to: currentTime).year!
        let m = Calendar.current.dateComponents([.month], from: epochTime!, to: currentTime).month!
        let D = Calendar.current.dateComponents([.day], from: epochTime!, to: currentTime).day!
        let h = Calendar.current.dateComponents([.hour], from: epochTime!, to: currentTime).hour!
        
        return (367*y - 7 * ( y + (m+9)/12 ) / 4 + 275*m/9 + D - 730530) + h/24
    }
}

//print(formattedTimeSinceEpoch())

//components.day
//var d = 367*y - 7 * ( y + (m+9)/12 ) / 4 + 275*m/9 + D - 730530
//getPosition()
