//
//  planet.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/29/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import Foundation

class Moon : Body{
    
    //--------------------------------------------initializers
    
    func display(texture: String?,
                 model: String?,
                 normalmap: String?) {
        self.texture = texture
        self.model = model
        self.normalmap = normalmap
    }
    
    override func generateOrbitalObjects() -> [(String, String, String)] {
        var ret = super.generateOrbitalObjects()
        var temp = [(String, String, String)]()
        
        if orbital_length != nil{
            temp.append(("Orbital Length", toScientificNotation(value: orbital_length!.converted(TimeUnit.day).rounded(6).amount), " days")) //for some reason, this library does not convert days properly
        }
        
        var orbitsEarth = false
        if (name == "Moon") {
            orbitsEarth = true
        }
        
        if (defaults.bool(forKey: "useImperial")) {
            if perigee != nil{
                ret.append((orbitsEarth ? "Perigee" : "Periapsis", toScientificNotation(value: perigee!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
            if apogee != nil{
                ret.append((orbitsEarth ? "Apogee" : "Apoapsis", toScientificNotation(value: apogee!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
        } else {
            if perigee != nil{
                ret.append((orbitsEarth ? "Perigee" : "Periapsis", toScientificNotation(value: perigee!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
            if apogee != nil{
                ret.append((orbitsEarth ? "Apogee" : "Apoapsis", toScientificNotation(value: apogee!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
        }
        
        ret = temp + ret
        return ret
    }
    
    override func generateMiscObjects() -> [(String, String)] {
        var ret = super.generateMiscObjects()
        
        ret.append(("Position from Planet", position))
        
        return ret
    }
    
}


