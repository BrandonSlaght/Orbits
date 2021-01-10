import Foundation
import UIKit

extension UIColor {
	struct Orbits {
		
		static var SpaceGray:			UIColor {return UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)}
		
		static var MercuryPrimary:		UIColor {return UIColor(hex: "3C3C34")}
		static var MercurySecondary:	UIColor {return UIColor(hex: "CECECE")}
		static var VenusPrimary:		UIColor {return UIColor(hex: "774A36")}
		static var VenusSecondary:		UIColor {return UIColor(hex: "F5BF7F")}
		static var EarthPrimary:		UIColor {return UIColor(hex: "15334C")}
		static var EarthSecondary:		UIColor {return UIColor(hex: "C4C4BB")}
		static var MarsPrimary:			UIColor {return UIColor(hex: "5B4436")}
		static var MarsSecondary:		UIColor {return UIColor(hex: "B59087")}
		static var JupiterPrimary:		UIColor {return UIColor(hex: "623D16")}
		static var JupiterSecondary:	UIColor {return UIColor(hex: "BF9366")}
		static var SaturnPrimary:		UIColor {return UIColor(hex: "4F311B")}
		static var SaturnSecondary:		UIColor {return UIColor(hex: "CEBBA8")}
		static var UranusPrimary:		UIColor {return UIColor(hex: "727E7E")}
		static var UranusSecondary:		UIColor {return UIColor(hex: "71ACD4")}
		static var NeptunePrimary:		UIColor {return UIColor(hex: "565DA0")}
		static var NeptuneSecondary:	UIColor {return UIColor(hex: "88DAF6")}
		static var CeresPrimary:		UIColor {return UIColor(hex: "737373")}
		static var CeresSecondary:		UIColor {return UIColor(hex: "C5C5C5")}
		static var PlutoPrimary:		UIColor {return UIColor(hex: "524433")}
		static var PlutoSecondary:		UIColor {return UIColor(hex: "8B8B82")}
		static var HaumeaPrimary:		UIColor {return UIColor(hex: "612D2D")}
		static var HaumeaSecondary:		UIColor {return UIColor(hex: "D7C3B9")}
		static var MakemakePrimary:		UIColor {return UIColor(hex: "7A4E44")}
		static var MakemakeSecondary:	UIColor {return UIColor(hex: "EFD8CA")}
		static var ErisPrimary:			UIColor {return UIColor(hex: "3E322C")}
		static var ErisSecondary:		UIColor {return UIColor(hex: "83766F")}
		static var SunPrimary:			UIColor {return UIColor(hex: "CA9506")}
		static var SunSecondary:		UIColor {return UIColor(hex: "F9B243")}
	}
	
	convenience init(hex: String) {
		var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
		
		if (cString.hasPrefix("#")) {
			cString.remove(at: cString.startIndex)
		}
		
		if ((cString.count) != 6) {
			self.init(ciColor: .gray)
		}
		
		var rgbValue:UInt64 = 0
		Scanner(string: cString).scanHexInt64(&rgbValue)
		
		self.init(
			red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha: CGFloat(1.0)
		)
	}
}
