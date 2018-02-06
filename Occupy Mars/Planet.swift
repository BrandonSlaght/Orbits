//
//  planet.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/29/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import Foundation
import SwiftAA

class Planet : Body {
    
    //--------------------------------------------general
    
    var type: Type,
        classification: Class
    
    //--------------------------------------------orbit
    
    var min_distance_from_earth: Quantity?,
        max_distance_from_earth: Quantity?
    
    //--------------------------------------------orbital elements
    
    var aa: SwiftAA.Planet?
    
    //--------------------------------------------initializers
    
    init(name: String,
         type: Type,
         position: String,
         classification: Class ) {
        self.type = type
        self.classification = classification
        super.init(name: name, position: position)
    }
    
    func aa(planet: SwiftAA.Planet) {
        self.aa = planet
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
    
    override func generateOrbitalObjects() -> [(String, String, String)] {
        var ret = super.generateOrbitalObjects()
        var temp = [(String, String, String)]()
        
        if orbital_length != nil {
            temp.append(("Year Length", toScientificNotation(value: orbital_length!.converted(TimeUnit.day).rounded(6).amount), " days")) //for some reason, this library does not convert days properly
        }
        
        if (defaults.bool(forKey: "useImperial")) {
            if perigee != nil {
                ret.append(("Perihilion", toScientificNotation(value: perigee!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
            if apogee != nil {
                ret.append(("Aphelion", toScientificNotation(value: apogee!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
            if min_distance_from_earth != nil {
                ret.append(("Nearest to Earth", toScientificNotation(value: min_distance_from_earth!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
            if max_distance_from_earth != nil {
                ret.append(("Farthest from Earth", toScientificNotation(value: max_distance_from_earth!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
        } else {
            if perigee != nil {
                ret.append(("Perihilion", toScientificNotation(value: perigee!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
            if apogee != nil {
                ret.append(("Aphelion", toScientificNotation(value: apogee!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
            if min_distance_from_earth != nil {
                ret.append(("Nearest to Earth", toScientificNotation(value: min_distance_from_earth!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
            if max_distance_from_earth != nil {
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
        
        if position != "" {
            ret.append(("Position from Sun", position))
        }
        
        return ret
    }
}


