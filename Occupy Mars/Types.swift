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
    //case Other = "Other"
    
    static var count: Int { return Class.Dwarf.hashValue + 1}
    static let allValues = [Major, Dwarf]//, Other]
}

enum Size : Int {
    case small = 200
    case medium = 400
    case large = 1200
    case full = 2147483647
}

extension Int {
    var degreesToRadians: Double { return Double(self) * M_PI / 180 }
}

extension Double {
    var degreesToRadians: Double { return self * M_PI / 180 }
}
