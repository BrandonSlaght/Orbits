//
//  planet.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/29/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import Foundation

class Moon : Body{
    
    var hasDetails = false
    
    //--------------------------------------------initializers
    
    override func geology(mass: Quantity?,
                 volume: Quantity?,
                 equatorial: Quantity?,
                 density: Quantity?,
                 gravity: Quantity?,
                 escape_velocity: Quantity?,
                 irradiance: Double?,
                 geographic_height_variance: Quantity?) {
        super.geology(mass: mass,
                      volume: volume,
                      equatorial: equatorial,
                      density: density,
                      gravity: gravity,
                      escape_velocity: escape_velocity,
                      irradiance: irradiance,
                      geographic_height_variance: geographic_height_variance)
        self.hasDetails = true
    }
    
    override func orbitals (orbital_length: Quantity?,
                  perigee: Quantity?,
                  apogee: Quantity?,
                  velocity: Quantity?,
                  inclination: Double?,
                  eccentricity: Double?,
                  day_length: Quantity?,
                  equator_inclination: Double?) {
        super.orbitals(orbital_length: orbital_length,
                       perigee: perigee,
                       apogee: apogee,
                       velocity: velocity,
                       inclination: inclination,
                       eccentricity: eccentricity,
                       day_length: day_length,
                       equator_inclination: equator_inclination)
        self.hasDetails = true
    }
    
    override func atmosphere(surface_pressure: Double?,
                    average_temperature: Double?,
                    total_mass: Quantity?) {
        super.atmosphere(surface_pressure: surface_pressure,
                         average_temperature: average_temperature,
                         total_mass: total_mass)
        self.hasDetails = true
    }
    
    override func composition(composition: [(gas: String, ppm: Double)]) {
        super.composition(composition: composition)
        self.hasDetails = true
    }
    
    override func misc(discovered: String?) {
        super.misc(discovered: discovered)
        self.hasDetails = true
    }
    
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
        
        ret.append(("Position from Orbiting Planet", position))
        
        return ret
    }
    
}


