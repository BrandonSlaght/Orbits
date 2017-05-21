//
//  planet.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/29/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import Foundation

class Planet : Body {
    
    //--------------------------------------------general
    
    var type: Type,
        classification: Class
    
    //--------------------------------------------orbit
    
    var min_distance_from_earth: Quantity?,
        max_distance_from_earth: Quantity?
    
    //--------------------------------------------orbital elements
    
    var a: Double?, //Mean distance, or semi-major axis
        e: Double?, //Eccentricity
        T: Double?, //Time at perihelion
        i: Double?, //Inclination, i.e. the "tilt" of the orbit relative to the ecliptic.  The inclination varies from 0 to 180 degrees. If the inclination is larger than 90 degrees, the planet is in a retrogade orbit, i.e. it moves "backwards".
        N: Double?, //Longitude of Ascending Node. This is the angle, along the ecliptic, from the Vernal Point to the Ascending Node, which is the intersection between the orbit and the ecliptic, where the planet moves from south of to north of the ecliptic, i.e. from negative to positive latitudes.
        w: Double?,  //The angle from the Ascending node to the Perihelion, along the orbit.
        m: Double?, //Solar mass of the planet
        M1: Double? //mean anomaly
    
    //--------------------------------------------initializers
    
    init(name: String,
         type: Type,
         position: String,
         classification: Class ) {
        self.type = type
        self.classification = classification
        super.init(name: name, position: position)
    }
    
    func orbitals(year_length: Quantity?,
                  perihelion: Quantity?,
                  aphelion: Quantity?,
                  velocity: Quantity?,
                  inclination: Double?,
                  eccentricity: Double?,
                  day_length: Quantity?,
                  equator_inclination: Double?,
                  min_distance_from_earth: Quantity?,
                  max_distance_from_earth: Quantity?) {
        super.orbitals(orbital_length: year_length,
                       perigee: perihelion,
                       apogee: aphelion,
                       velocity: velocity,
                       inclination: inclination,
                       eccentricity: eccentricity,
                       day_length: day_length,
                       equator_inclination: equator_inclination)
        self.min_distance_from_earth = min_distance_from_earth
        self.max_distance_from_earth = max_distance_from_earth
    }
    
    func getVisibility() {
        //print("__________________")
        self.w = 282.9404 + (0.000047093 * formattedTimeSinceEpoch())
        self.a = 1.000000
        self.e = 0.016709 - (0.000000001151 * formattedTimeSinceEpoch())
        self.M1 = 356.0470 + (0.9856002585 * formattedTimeSinceEpoch())
        self.m = 1
        self.i = inclination!
        self.N = 0
        let s = Sextant(p: self)
//        print(w)
//        print(a)
//        print(e)
//        print(M1)
//        print(m)
//        print(i)
//        print(N)
//        print("__________________")
//        //-> (NSDate, NSDate) {
//        let s = Sextant(N: 125.1228 - 0.0529538083 * Double(formattedTimeSinceEpoch()),
//                            i: 5.1454,
//                            w: 318.0634 + 0.1643573223 * Double(formattedTimeSinceEpoch()),
//                            a: 60.2666,
//                            e: 0.054900,
//                            M: 115.3654 + 13.0649929509 * Double(formattedTimeSinceEpoch()))
        s.getPosition()
    }
    
    func formattedTimeSinceEpoch() -> Double { //y, m, d,
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        //let epochTime = formatter.date(from: "2000/1/01 00:00")
        
        //let currentTime = Date()
        let currentTime = formatter.date(from: "1990/4/19 00:00")
        
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour], from: currentTime!)
        //print("---------------------------")
        let y = components.year!
        let m = components.month!
        let D = components.day!
        let h = components.hour!
        
        //print(y)
        //print(m)
        //print(D)
        //print(h)
        
        //let y = Calendar.current.dateComponents([.year], from: epochTime!, to: currentTime!).year!
        //let m = Calendar.current.dateComponents([.month], from: epochTime!, to: currentTime!).month!
        //let D = Calendar.current.dateComponents([.day], from: epochTime!, to: currentTime!).day!
        //let h = Calendar.current.dateComponents([.hour], from: epochTime!, to: currentTime!).hour!
        
        let zero = Int(367 * y)
        let one = Int((7 * (y + Int((m + 9) / 12))) / 4)
        //let one = Int((y + Int((m + 9) / 12)) / 4)
        let two = Int((275 * m) / 9)
        let three = Double(D - 730530 + h / 24)
        let four = Double(Double(two) - Double(one) + three)
        
        //print(zero)
        //print(one)
        //print(two)
        //print(three)
        //print(four)
        
        //print(Double(zero) + four)
        
        //print("--------------------------")
        
        return Double(zero) + four
    }
    
    override func generateOrbitalObjects() -> [(String, String, String)] {
        var ret = super.generateOrbitalObjects()
        var temp = [(String, String, String)]()
        
        if orbital_length != nil{
            temp.append(("Year Length", toScientificNotation(value: orbital_length!.converted(TimeUnit.day).rounded(6).amount), " days")) //for some reason, this library does not convert days properly
        }
        
        if (defaults.bool(forKey: "useImperial")) {
            if perigee != nil{
                ret.append(("Perihilion", toScientificNotation(value: perigee!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
            if apogee != nil{
                ret.append(("Aphelion", toScientificNotation(value: apogee!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
            if min_distance_from_earth != nil{
                ret.append(("Nearest to Earth", toScientificNotation(value: min_distance_from_earth!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
            if max_distance_from_earth != nil{
                ret.append(("Farthest from Earth", toScientificNotation(value: max_distance_from_earth!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
        } else {
            if perigee != nil{
                ret.append(("Perihilion", toScientificNotation(value: perigee!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
            if apogee != nil{
                ret.append(("Aphelion", toScientificNotation(value: apogee!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
            if min_distance_from_earth != nil{
                ret.append(("Nearest to Earth", toScientificNotation(value: min_distance_from_earth!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
            if max_distance_from_earth != nil{
                ret.append(("Farthest from Earth", toScientificNotation(value: max_distance_from_earth!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
        }
        
        ret = temp + ret
        return ret
    }
    
    override func generateMiscObjects() -> [(String, String)] {
        var ret = super.generateMiscObjects()
        
        ret.append(("Moons",String(describing: moons.count)))
        
        if rings.count > 0 {
            ret.append(("Ring System", "Yes"))
        } else {
            ret.append(("Ring System", "No"))
        }
        
        ret.append(("Type", type.rawValue))
        
        ret.append(("Position from Sun", position))
        
        return ret
    }
}


