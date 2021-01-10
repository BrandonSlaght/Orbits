import Foundation
import SceneKit

class Body {
	
	//--------------------------------------------settings
	
	let defaults = UserDefaults.standard
	var hasDetails = false
	
	//--------------------------------------------general
	
	var name: String,
		position: String
	
	//--------------------------------------------about
	
	var description: String?,
		wiki: String?,
		nasa: String?
	
	//--------------------------------------------geology - notes: use equatorial radius and mean density and surface gravity / acceleration
	
	var mass: Quantity?,
		volume: Quantity?,
		equatorial: Quantity?,
		density: Quantity?,
		gravity: Quantity?,
		escape_velocity: Quantity?,
		irradiance: Double?,
		geographic_height_variance: Quantity?
	
	//--------------------------------------------orbit - notes: use tropical orbit, mean orbital velocity, and obliquidy from orbit for equator inclination - for moons, use inclination from host planet equator
	
	var orbital_length: Quantity?,
		perigee: Quantity?,
		apogee: Quantity?,
		velocity: Quantity?,
		inclination: Double?,
		eccentricity: Double?,
		day_length: Quantity?,
		equator_inclination: Double?
	
	//--------------------------------------------atmosphere - notes: use metric tones for total mass
	
	var surface_pressure: Double?,
		average_temperature: Double?,
		total_mass: Quantity?
	var composition = [(gas: String,
						ppm: Double)]()
	
	//--------------------------------------------moons
	
	var moons = [Moon]()
	
	//--------------------------------------------rings
	
	var rings = [(name: String,
				  width: Quantity,
				  thickness: Quantity,
				  density: Double)]()
	
	//--------------------------------------------miscelanious
	
	var discovered: String?,
		pronunciation: String?
	
	//--------------------------------------------visual
	
	var texture: String?,
		model: String?,
		normalmap: String?,
		ringmap: String?,
		ring_transparencymap: String?,
		ring_inner_ratio: Double?,
		ring_outer_ratio: Double?
	
	//--------------------------------------------media
	
	var images = [(image: String,
				   caption: String)](),
		videos = [String](),
		thumbnail: String?
	
	//--------------------------------------------visuals
	
	var background: String?,
		color1: UIColor?,
		color2: UIColor?
	
	//--------------------------------------------initializers
	
	init(name: String,
		 position: String) {
		self.name = name
		self.position = position
	}
	
	func about(description: String?,
			   wiki: String?,
			   nasa: String?) {
		self.description = description
		self.wiki = wiki
		self.nasa = nasa
	}
	
	func geology(mass: Quantity?,
				 volume: Quantity?,
				 equatorial: Quantity?,
				 density: Quantity?,
				 gravity: Quantity?,
				 escape_velocity: Quantity?,
				 irradiance: Double?,
				 geographic_height_variance: Quantity?) {
		self.mass = mass
		self.volume = volume
		self.equatorial = equatorial
		self.density = density
		self.gravity = gravity
		self.escape_velocity = escape_velocity
		self.irradiance = irradiance
		self.geographic_height_variance = geographic_height_variance
		self.hasDetails = true
	}
	
	func orbitals(orbital_length: Quantity?,
				  perigee: Quantity?,
				  apogee: Quantity?,
				  velocity: Quantity?,
				  inclination: Double?,
				  eccentricity: Double?,
				  day_length: Quantity?,
				  equator_inclination: Double?) {
		self.orbital_length = orbital_length
		self.perigee = perigee
		self.apogee = apogee
		self.velocity = velocity
		self.inclination = inclination
		self.eccentricity = eccentricity
		self.day_length = day_length
		self.equator_inclination = equator_inclination
		self.hasDetails = true
	}
	
	func atmosphere(surface_pressure: Double?,
					average_temperature: Double?,
					total_mass: Quantity?) {
		self.surface_pressure = surface_pressure
		self.average_temperature = average_temperature
		self.total_mass = total_mass
		self.hasDetails = true
	}
	
	func composition(composition: [(gas: String, ppm: Double)]) {
		self.composition = composition
		self.hasDetails = true
	}
	
	func misc(pronunciation: String?,
			  discovered: String?) {
		self.pronunciation = pronunciation
		self.discovered = discovered
	}
	
	func display(texture: String?,
				 model: String?,
				 normalmap: String?,
				 ringmap: String?,
				 ring_transparencymap: String?,
				 ring_inner_ratio: Double?,
				 ring_outer_ratio: Double?) {
		self.texture = texture
		self.model = model
		self.normalmap = normalmap
		self.ringmap = ringmap
		self.ring_transparencymap = ring_transparencymap
		self.ring_inner_ratio = ring_inner_ratio
		self.ring_outer_ratio = ring_outer_ratio
		self.hasDetails = true
	}
	
	func images(images: [(image: String, caption: String)], thumbnail: String?) {
		self.images = images
		self.thumbnail = thumbnail
	}
	
	func colors(background: String?,
				color1: UIColor?,
				color2: UIColor?) {
		self.background = background
		self.color1 = color1
		self.color2 = color2
	}
	
	//--------------------------------------------helpers
	
	func resizeImage(_ image: UIImage, newHeight: CGFloat) -> UIImage {
		if newHeight > image.size.height {
			return image
		}
		let scale = newHeight / image.size.height
		let newWidth = image.size.width * scale
		UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
		image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return newImage!
	}
	
	func toScientificNotation(value: NSNumber) -> String {
		if value.floatValue < 10000000 {
			return String(describing: value)
		}
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = NumberFormatter.Style.scientific
		numberFormatter.positiveFormat = "0.### x E+0"
		numberFormatter.exponentSymbol = " × 10^"
		numberFormatter.minimumFractionDigits = 2
		numberFormatter.maximumFractionDigits = 6
		return numberFormatter.string(from: value)!
	}
	
	//REFACTOR
	func getScene(size: Size) -> SCNScene? {
		if(texture == nil && model == nil) {
			return nil
		}
		
		let scene = SCNScene()
		
		let ambientLightNode = SCNNode()
		ambientLightNode.light = SCNLight()
		ambientLightNode.light!.type = SCNLight.LightType.ambient
		ambientLightNode.light!.color = UIColor(white: 0.11, alpha: 1.0)
		scene.rootNode.addChildNode(ambientLightNode)
		
		var planet : SCNGeometry
		
		planet = SCNSphere(radius: 1.0)
		
		if let let_model = self.model {
			let tempScene: SCNScene
			
			if size == Size.small || size == Size.micro {
				tempScene = SCNScene(named: String(let_model.dropLast(4)) + " - thumbnail.dae")!
			} else {
				tempScene = SCNScene(named: let_model)!
			}
			
			let geometry = tempScene.rootNode.childNodes[0]
			geometry.name = "planet"
			
			let spin = CABasicAnimation(keyPath: "rotation")
			spin.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
			spin.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2 * Double.pi)))
			
			if let let_day_length = self.day_length {
				spin.duration = let_day_length.converted(TimeUnit.minute).amount.doubleValue/24
			} else {
				spin.duration = 60
			}
			
			spin.repeatCount = .infinity
			
			geometry.addAnimation(spin, forKey: "spin around")
			
			scene.rootNode.addChildNode(geometry)
		} else {
			if size == Size.micro {
				(planet as! SCNSphere).segmentCount = 15
			} else if size == Size.small {
				(planet as! SCNSphere).segmentCount = 30
			} else {
				(planet as! SCNSphere).segmentCount = 80
			}
		}
		
		if let let_texture = self.texture {
			let material = SCNMaterial()
			
			if size == Size.small || size == Size.micro {
				material.diffuse.contents = UIImage(named: String(let_texture.dropLast(4)) + " - thumbnail.jpg")!
			} else {
				material.diffuse.contents = self.resizeImage(UIImage(named: let_texture)!, newHeight: CGFloat(size.rawValue))
			}
			material.diffuse.mipFilter = SCNFilterMode.linear
			
			if let let_normalmap = self.normalmap {
				if size != Size.small && size != Size.micro {
					material.normal.contents = self.resizeImage(UIImage(named: let_normalmap)!, newHeight: CGFloat(size.rawValue))
					material.normal.mipFilter = SCNFilterMode.linear
				}
			}
			
			planet.materials = [material]
			let planetNode = SCNNode(geometry: planet)
			planetNode.name = "planet"
			let rotationNode = SCNNode()
			rotationNode.addChildNode(planetNode)
			scene.rootNode.addChildNode(rotationNode)
			let spin = CABasicAnimation(keyPath: "rotation")
			spin.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
			spin.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2 * Double.pi)))
			if let let_day_length = self.day_length {
				spin.duration = let_day_length.converted(TimeUnit.minute).amount.doubleValue/24
			} else {
				spin.duration = 60
			}
			spin.repeatCount = .infinity
			planetNode.addAnimation(spin, forKey: "spin around")
			
			if let let_ringsmap = self.ringmap {
				let rings = SCNTorus(ringRadius: 2, pipeRadius: 0.5)
				
				if let let_ring_inner_ratio = self.ring_inner_ratio, let let_ring_outer_ratio = self.ring_outer_ratio {
					rings.pipeRadius = CGFloat((let_ring_outer_ratio - let_ring_inner_ratio) / 2)
					rings.ringRadius = CGFloat(let_ring_outer_ratio - 0.5) //+ let_ring_inner_ratio) / 2) //CGFloat(let_ring_outer_ratio / )
				}
				rings.ringSegmentCount = 176
				
				let material = SCNMaterial()
				material.isDoubleSided = true
				material.diffuse.contents = UIImage(named: let_ringsmap)!
				material.diffuse.mipFilter = SCNFilterMode.linear
				material.diffuse.wrapT = SCNWrapMode.repeat
				material.transparencyMode = .rgbZero
				
				if let let_ring_transparencymap = self.ring_transparencymap {
					material.transparent.contents = UIImage(named: let_ring_transparencymap)!
					material.transparent.mipFilter = SCNFilterMode.linear
					material.transparent.wrapT = SCNWrapMode.repeat
				}
				
				rings.materials = [material]
				let ringNode = SCNNode(geometry: rings)
				ringNode.scale = SCNVector3(x: 1, y: 0.01, z: 1)
				planetNode.addChildNode(ringNode)
			}
			if let let_equator_inclination = self.equator_inclination {
				if self.ringmap != nil {
					rotationNode.rotation = SCNVector4(x: 0.5, y: 0, z: 1, w: Float(let_equator_inclination.degreesToRadians))
				} else {
					rotationNode.rotation = SCNVector4(x: 0, y: 0, z: 1, w: Float(let_equator_inclination.degreesToRadians))
				}
			}
		}
		return scene
	}
	
	func generateGeologyObjects() -> [(String, String, String)] {
		var ret = [(String, String, String)]()
		let scale: Int16 = 6
		let behavior = NSDecimalNumberHandler(roundingMode: .plain, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
		if (defaults.bool(forKey: "useImperial")) {
			if mass != nil {
				ret.append(("Mass", toScientificNotation(value: mass!.converted(MassUnit.pound).rounded(6).amount), " lb"))
			}
			if volume != nil {
				ret.append(("Volume", toScientificNotation(value: volume!.converted(LengthUnit.mile).rounded(6).amount), " mi³"))
			}
			if density != nil {
				ret.append(("Density", toScientificNotation(value: density!.converted(MassUnit.kilogram).amount.dividing(by:16.02).rounding(accordingToBehavior: behavior)), " lb/ft³"))
			}
			if equatorial != nil {
				ret.append(("Radius", toScientificNotation(value: equatorial!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
			}
			if gravity != nil {
				ret.append(("Gravity", toScientificNotation(value: gravity!.converted(LengthUnit.foot).rounded(6).amount), " ft/s²"))
			}
			if escape_velocity != nil {
				ret.append(("Escape Velocity", toScientificNotation(value: escape_velocity!.converted(LengthUnit.mile).rounded(6).amount), " mi/s"))
			}
			if irradiance != nil {
				let value = NSDecimalNumber.init(value: irradiance!/10.7639105)
				ret.append(("Irradiance", String(describing: value.rounding(accordingToBehavior: behavior)), " W/ft²"))
			}
			if geographic_height_variance != nil {
				ret.append(("Height Variance", toScientificNotation(value: geographic_height_variance!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
			}
		} else {
			if mass != nil {
				ret.append(("Mass", toScientificNotation(value: mass!.converted(MassUnit.kilogram).rounded(6).amount), " kg"))
			}
			if volume != nil {
				ret.append(("Volume", toScientificNotation(value: volume!.converted(LengthUnit.kilometer).rounded(6).amount), " km³"))
			}
			if density != nil {
				ret.append(("Density", toScientificNotation(value: density!.converted(MassUnit.kilogram).rounded(6).amount), " kg/m³"))
			}
			if equatorial != nil {
				ret.append(("Radius", toScientificNotation(value: equatorial!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
			}
			if gravity != nil {
				ret.append(("Gravity", toScientificNotation(value: gravity!.converted(LengthUnit.meter).rounded(6).amount), " m/s²"))
			}
			if escape_velocity != nil {
				ret.append(("Escape Velocity", toScientificNotation(value: escape_velocity!.converted(LengthUnit.kilometer).rounded(6).amount), " km/s"))
			}
			if irradiance != nil {
				ret.append(("Irradiance", String(describing: irradiance!), " W/m²"))
			}
			if geographic_height_variance != nil {
				ret.append(("Height Variance", toScientificNotation(value: geographic_height_variance!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
			}
		}
		return ret
	}
	
	func generateOrbitalObjects() -> [(String, String, String)] {
		var ret = [(String, String, String)]()
		if day_length != nil {
			ret.append(("Day Length", toScientificNotation(value: day_length!.converted(TimeUnit.hour).rounded(6).amount), " hours"))
		}
		if (defaults.bool(forKey: "useImperial")) {
			if velocity != nil {
				ret.append(("Average Velocity", toScientificNotation(value: velocity!.converted(LengthUnit.mile).rounded(6).amount), " mi/s"))
			}
		} else {
			if velocity != nil {
				ret.append(("Average Velocity", toScientificNotation(value: velocity!.converted(LengthUnit.kilometer).rounded(6).amount), " km/s"))
			}
		}
		if inclination != nil {
			ret.append(("Orbital Tilt", String(describing: inclination!), " degrees"))
		}
		if eccentricity != nil {
			ret.append(("Eccentricity", String(describing: eccentricity!), ""))
		}
		if equator_inclination != nil {
			ret.append(("Equatorial Tilt", String(describing: equator_inclination!), " degrees"))
		}
		return ret
	}
	
	func generateMiscObjects() -> [(String, String)] {
		var ret = [(String, String)]()
		if discovered != nil {
			ret.append(("Date of Discovery", discovered!))
		}
		if pronunciation != nil {
			ret.append(("Pronunciation", pronunciation!))
		}
		return ret
	}
}
