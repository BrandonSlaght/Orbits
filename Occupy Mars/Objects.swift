//
//  objects.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/30/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import Foundation

class Objects {
    
    static func planets() -> [Class: [Planet]] {
        
        let Mercury = Planet(name: "Mercury", type: Type.Rock, position: 1, classification: Class.Major)
        Mercury.display("mercurymap.jpg", model: nil, normalmap: nil)
        
        let Venus = Planet(name: "Venus", type: Type.Rock, position: 2, classification: Class.Major)
        Venus.display("venusmap.jpg", model: nil, normalmap: nil)
        Venus.orbitals(224.701, perihelion: 107.48, aphelion: 108.94, velocity: 35.02, inclination: 3.39, eccentricity: 0.0067, day_length: 2802.0, equator_inclination: 177.36, min_distance_from_earth: 38.2, max_distance_from_earth: 261.0)
        
        let Mars = Planet(name: "Mars", type: Type.Rock, position: 4, classification: Class.Major)
        Mars.display("marsmap.jpg", model: nil, normalmap: "test_normal_map.jpg")
        Mars.about("Mars is a cold desert world. It is half the diameter of Earth and has the same amount of dry land. Like Earth, Mars has seasons, polar ice caps, volcanoes, canyons and weather, but its atmosphere is too thin for liquid water to exist for long on the surface. There are signs of ancient floods on Mars, but evidence for water now exists mainly in icy soil and thin clouds.", wiki: "https://en.m.wikipedia.org/wiki/Mars", nasa: "http://solarsystem.nasa.gov/planets/mars")
        Mars.geology(mass: 10, volume: 10, equatorial: 10, density: 10, gravity: 10, escape_velocity: 11, irradiance: 12903, geographic_height_variance: 123)
        Mars.orbitals(400, perihelion: 100, aphelion: 120, velocity: 400, inclination: 3, eccentricity: 4, day_length: 26, equator_inclination: 2, min_distance_from_earth: 100, max_distance_from_earth: 600)
        Mars.images(["mars - olympus mons.jpg", "mars - landscape.jpg", "mars - pole.jpg", "mars - frosted dunes.jpg", "mars - valles marineris.png", "mars - curiosity selfie.jpg"])
        let Phobos = Moon(name: "Phobos", position: 1)
        Phobos.display("phobosmap.jpg", model: "phobos.obj", normalmap: "phobosnormals.jpg")
        Mars.moons.append(Phobos)
        
        
        
        let Pluto = Planet(name: "Pluto", type: Type.Rock, position: 9, classification: Class.Dwarf)
        Pluto.display("plutomap.jpg", model: nil, normalmap: nil)
        
        
        
        return [Class.Major: [Mercury, Venus, Mars], Class.Dwarf: [Pluto]]
    }
    
    static func itemsInSection(_ section: Int) -> Int {
        let objects = planets()
        let classification = Class.allValues[section]
        return objects[classification]!.count
//        var count = 0
//        for planet in objects {
//            if planet.classification == section {
//                count += 1
//            }
//        }
//        return count
    }
}
