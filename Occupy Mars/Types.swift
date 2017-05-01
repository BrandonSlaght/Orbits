//
//  types.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/29/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import Foundation

enum Type : String {
    case Rock = "Rocky Planet"
    case Gas = "Gas Giant"
    case Ice = "Ice Giant"
    case Star = "Star"
}

enum Class : String {
    case Major = "Planets"
    case Dwarf = "Dwarf Planets"
    case Other = "Other"
    
    static var count: Int { return Class.Other.hashValue + 1}
    static let allValues = [Major, Dwarf, Other]
}

enum Size : Int {
    case small = 200
    case medium = 400
    case large = 1200
    case full = 2147483647
}

let Change : [String] = [
    "1.2: \n Fixed some of the crashes in the globe view controller \n Added floating tabs \nAdded tooltip popups \n Added settings to change between metric and simplified units \n Added oberon partial map \n Added epimetheus model \n Added sun \n Reduced app size by 100 mb \n Minor text fixes \n UI improvements",
    "1.2.1: \n Fixed a possible crash in the globe view",
    "1.2.2: \n Reduced minimum iOS version to 10.0 \n Fixed performance issues when scrolling lists of moons and planets",
    "1.2.3: \n Added a 'What's New' dialogue \n Added details to moons of Earth, Mars, Haumea, Makemake, and Eris \n Spotlight support! You can now search planets and moons from the app directly in Spotlight"]

extension Int {
    var degreesToRadians: Double { return Double(self) * Double.pi / 180 }
}

extension Double {
    var degreesToRadians: Double { return self * Double.pi / 180 }
}
