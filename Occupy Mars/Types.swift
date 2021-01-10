import Foundation

enum Type : String {
	case Rock = "Rocky Planet"
	case Gas = "Gas Giant"
	case Ice = "Ice Giant"
	case Star = "Star"
	case Moon = "Rocky Moon"
}

enum Class : String {
	case Major = "Planets"
	case Dwarf = "Dwarf Planets"
	case Other = "Other"
	
	static var count: Int { return Class.Other.hashValue + 1}
	static let allValues = [Major, Dwarf, Other]
}

enum Size : Int {
	case micro = 50
	case small = 200
	case medium = 400
	case large = 1200
	case full = 2147483647
}
