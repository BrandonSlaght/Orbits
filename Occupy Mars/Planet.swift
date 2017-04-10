//
//  planet.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/29/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import Foundation
import SceneKit

// notes: use metric and kelvin

class Planet {
    
    //--------------------------------------------general
    
    var name: String,
        type: Type,
        position: Int,
        classification: Class
    
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
    
    //--------------------------------------------orbit - notes: use tropical orbit, mean orbital velocity, and obliquidy from orbit for equator inclination
    
    var year_length: Quantity?,
        perihelion: Quantity?,
        aphelion: Quantity?,
        velocity: Quantity?,
        inclination: Double?,
        eccentricity: Double?,
        day_length: Quantity?,
        equator_inclination: Double?,
        min_distance_from_earth: Quantity?,
        max_distance_from_earth: Quantity?
    
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
    
    var discovered: String?
    
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
                   caption: String)]()
    var videos = [String]()
    
    //--------------------------------------------visuals
    
    var background: String?,
        color1: UIColor?,
        color2: UIColor?
    
    //--------------------------------------------initializers
    
    init(name: String,
         type: Type,
         position: Int,
         classification: Class ) {
        self.name = name
        self.type = type
        self.position = position
        self.classification = classification
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
        self.year_length = year_length
        self.perihelion = perihelion
        self.aphelion = aphelion
        self.velocity = velocity
        self.inclination = inclination
        self.eccentricity = eccentricity
        self.day_length = day_length
        self.equator_inclination = equator_inclination
        self.min_distance_from_earth = min_distance_from_earth
        self.max_distance_from_earth = max_distance_from_earth
    }
    
    func atmosphere(surface_pressure: Double?,
                    average_temperature: Double?,
                    total_mass: Quantity?) {
        self.surface_pressure = surface_pressure
        self.average_temperature = average_temperature
        self.total_mass = total_mass
    }
    
    func composition(composition: [(gas: String, ppm: Double)]) {
        self.composition = composition
    }
    
    func misc(discovered: String?) {
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
    }
    
    func images(images: [(image: String, caption: String)]) {
        self.images = images
    }
    
    func colors(background: String?,
                color1: String,
                color2: String) {
        self.background = background
        self.color1 = hexStringToUIColor(hex: color1)
        self.color2 = hexStringToUIColor(hex: color2)
    }
    
    //--------------------------------------------helpers
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func getScene(size: Size) -> SCNScene? {
        
        let scene = SCNScene()
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLight.LightType.ambient
        ambientLightNode.light!.color = UIColor(white: 0.11, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
        
        var planet : SCNGeometry
        
        if let let_model = model {
            let tempScene = SCNScene(named: let_model)
            planet = tempScene!.rootNode.childNodes[0].geometry! //= SCNGeometry  //(sources: [SCNGeometrySource], elements: <#T##[SCNGeometryElement]#>)
        } else {
            planet = SCNSphere(radius: 1.0)
            (planet as! SCNSphere).segmentCount = 80
        }
        
        if let let_texture = texture {
            
            let material = SCNMaterial()
            
            if size == Size.small {
                material.diffuse.contents = UIImage(named: String(let_texture.characters.dropLast(4)) + " - thumbnail.jpg")!
            } else {
                material.diffuse.contents = resizeImage(UIImage(named: let_texture)!, newHeight: CGFloat(size.rawValue))
            }
            material.diffuse.mipFilter = SCNFilterMode.linear
            
            if let let_normalmap = normalmap {
                if size == Size.small {
                    //material.normal.contents = UIImage(named: String(let_normalmap.characters.dropLast(4)) + " - thumbnail.jpg")!
                } else {
                    material.normal.contents = resizeImage(UIImage(named: let_normalmap)!, newHeight: CGFloat(size.rawValue))
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
            
            if let let_day_length = day_length {
                spin.duration = let_day_length.converted(TimeUnit.minute).amount.doubleValue/24
            } else {
                spin.duration = 60
            }
            
            spin.repeatCount = .infinity
            planetNode.addAnimation(spin, forKey: "spin around")
            
            if let let_ringsmap = ringmap {
                let rings = SCNTorus(ringRadius: 2, pipeRadius: 0.5)
                //print("here")
                
                if let let_ring_inner_ratio = ring_inner_ratio, let let_ring_outer_ratio = ring_outer_ratio {
                    //print("hereeeeee")
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

                if let let_ring_transparencymap = ring_transparencymap {
                    material.transparent.contents = UIImage(named: let_ring_transparencymap)!
                    material.transparent.mipFilter = SCNFilterMode.linear
                    material.transparent.wrapT = SCNWrapMode.repeat
                }
                
                rings.materials = [material]
                
                let ringNode = SCNNode(geometry: rings)
                
                ringNode.scale = SCNVector3(x: 1, y: 0.01, z: 1)
                
                planetNode.addChildNode(ringNode)
                
                //rotationNode.rotation = (SCNVector4: SCNVector4(x: 1, y: 0, z: 0, w: 0.2))
            }
            
            if size == Size.full {
                
//                let spot = SCNLight()
//                spot.type = SCNLight.LightType.spot
//                spot.castsShadow = true
//                
//                let spotNode = SCNNode()
//                spotNode.light = spot
//                spotNode.position = SCNVector3(x: 0, y: 0, z: 7)
//                spotNode.geometry = SCNSphere(radius: 1)
//                
//                let offsetNode = SCNNode()
//                offsetNode.light = spot
//                offsetNode.position = SCNVector3(x: 0, y: 0, z: -7)
//                offsetNode.geometry = SCNSphere(radius: 1)
//                offsetNode.geometry?.materials = []
//                
//                let sunNode = SCNNode()
//                sunNode.addChildNode(spotNode)
//                sunNode.addChildNode(offsetNode)
//                
//                let lookAt = SCNLookAtConstraint(target: rotationNode)
//                spotNode.constraints = [lookAt]
//                
//                let orbit = CABasicAnimation(keyPath: "rotation")
//                orbit.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
//                orbit.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2 * Double.pi)))
//                
//                if let let_day_length = day_length {
//                    orbit.duration = let_day_length.converted(TimeUnit.minute).amount.doubleValue/24
//                } else {
//                    orbit.duration = 60
//                }
//                
//                orbit.repeatCount = .infinity
//                sunNode.addAnimation(orbit, forKey: "spin around")
//                
//                scene.rootNode.addChildNode(sunNode)
//                
//                print("FULL")
//                let camera = SCNCamera()
//                camera.usesOrthographicProjection = true
//                camera.orthographicScale = 1.5
//                camera.zNear = 0
//                camera.zFar = 80
//                let cameraNode = SCNNode()
//                cameraNode.name = "camera"
//                cameraNode.position = SCNVector3(x: 0, y: 0, z: 20)
//                cameraNode.camera = camera
//                let cameraOrbit = SCNNode()
//                cameraOrbit.name = "cameraOrbit"
//                cameraOrbit.addChildNode(cameraNode)
//                scene.rootNode.addChildNode(cameraOrbit)
                
                // rotate it (I've left out some animation code here to show just the rotation)
                //cameraOrbit.eulerAngles.x -= Float(M_PI_4)
                //cameraOrbit.eulerAngles.y -= Float(M_PI_4*3)
            }
            
            if let let_equator_inclination = equator_inclination {
                
                //                let spin1 = CABasicAnimation(keyPath: "otherrotation")
                //                spin1.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 0, z: 1, w: 0))
                //                spin1.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 0, z: 1, w: Float(2 * M_PI)))
                //                spin1.duration = 60
                //                spin1.repeatCount = .infinity
                //                planetNode.addAnimation(spin1, forKey: "spin around again")
                
                //rotationNode.eulerAngles = (SCNVector3: SCNVector3(x: 0, y: 0, z: Float(let_equator_inclination.degreesToRadians)))
                
                if ringmap != nil {
                    rotationNode.rotation = SCNVector4(x: 0.5, y: 0, z: 1, w: Float(let_equator_inclination.degreesToRadians))
                    //rotationNode.rotation.z = (SCNVector4: SCNVector4(x: 0, y: 0, z: 1, w: Float(let_equator_inclination.degreesToRadians))).SCNVector4.z
                } else {
                    rotationNode.rotation = SCNVector4(x: 0, y: 0, z: 1, w: Float(let_equator_inclination.degreesToRadians))
                    //rotationNode.boundingBox = box
                }
                //let shrink_factor = let_equator_inclination.degreesToRadians
                //print("scale before: \(view.pointOfView?.camera?.orthographicScale)")
                //view.pointOfView?.camera?.orthographicScale -= shrink_factor
                //print("scale after: \(view.pointOfView?.camera?.orthographicScale)")
                //print(shrink_factor)
                //planetNode.scale = (SCNVector3: SCNVector3(x: 50, y: 50, z: 50))
                //planetNode.scale = (SCNVector3: SCNVector3(x: shrink_factor, y: shrink_factor, z: shrink_factor))
                //rotationNode.scale = (SCNVector3: SCNVector3(x: 20, y: 20, z: 20))//shrink_factor, y: shrink_factor, z: shrink_factor))
                //planetNode.position = (SCNVector3: SCNVector3(x: 0, y: 0, z: 20))
                
                //(planet as! SCNSphere).radius = 2.0
            }
            
        } else {
            return nil
        }
        
        return scene
    }
    
    func getPrettyVisibility() -> String {
        return "Visible Tonight"
    }
    
    func getVisibility() {//-> (NSDate, NSDate) {
        let s = Sextant(N: 125.1228 - 0.0529538083 * Double(formattedTimeSinceEpoch()),
                            i: 5.1454,
                            w: 318.0634 + 0.1643573223 * Double(formattedTimeSinceEpoch()),
                            a: 60.2666,
                            e: 0.054900,
                            M: 115.3654 + 13.0649929509 * Double(formattedTimeSinceEpoch()))
        print(s.getPosition())
    }
    
    func formattedTimeSinceEpoch() -> Int { //y, m, d,
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let epochTime = formatter.date(from: "2000/1/01 00:00")
        
        let currentTime = Date()
        
        let y = Calendar.current.dateComponents([.year], from: epochTime!, to: currentTime).year!
        let m = Calendar.current.dateComponents([.month], from: epochTime!, to: currentTime).month!
        let D = Calendar.current.dateComponents([.day], from: epochTime!, to: currentTime).day!
        let h = Calendar.current.dateComponents([.hour], from: epochTime!, to: currentTime).hour!
        
        return (367*y - 7 * ( y + (m+9)/12 ) / 4 + 275*m/9 + D - 730530) + h/24
    }
    
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
    
    func generateGeologyObjects() -> [(String, String, String)] {
        var ret = [(String, String, String)]()
        
        if mass != nil{
            ret.append(("Mass", toScientificNotation(value: mass!.converted(MassUnit.kilogram).rounded(7).amount), " kg"))
        }
        if volume != nil{
            ret.append(("Volume", toScientificNotation(value: volume!.converted(LengthUnit.kilometer).rounded(7).amount), " km³"))
        }
        if density != nil{
            ret.append(("Density", toScientificNotation(value: density!.converted(MassUnit.kilogram).rounded(7).amount), " kg/m³"))
        }
        if equatorial != nil{
            ret.append(("Radius", toScientificNotation(value: equatorial!.converted(LengthUnit.kilometer).rounded(7).amount), " km"))
        }
        if gravity != nil{
            ret.append(("Gravity", toScientificNotation(value: gravity!.converted(LengthUnit.meter).rounded(7).amount), " m/s²"))
        }
        if escape_velocity != nil{
            ret.append(("Escape Velocity", toScientificNotation(value: escape_velocity!.converted(LengthUnit.kilometer).rounded(7).amount), " km/s"))
        }
        if irradiance != nil{
            ret.append(("Irradiance", String(describing: irradiance!), " W/m²"))
        }
        if geographic_height_variance != nil{
            ret.append(("Height Variance", toScientificNotation(value: geographic_height_variance!.converted(LengthUnit.kilometer).rounded(7).amount), " km"))
        }
        
        return ret
    }
    
    func generateOrbitalObjects() -> [(String, String, String)] {
        var ret = [(String, String, String)]()
        
        if year_length != nil{
            ret.append(("Year Length", toScientificNotation(value: year_length!.converted(TimeUnit.day).rounded(7).amount), " days")) //for some reason, this library does not convert days properly
        }
        if day_length != nil{
            ret.append(("Day Length", toScientificNotation(value: day_length!.converted(TimeUnit.hour).rounded(7).amount), " hours"))
        }
        if velocity != nil{
            ret.append(("Average Velocity", toScientificNotation(value: velocity!.converted(LengthUnit.kilometer).rounded(7).amount), " km/h"))
        }
        if perihelion != nil{
            ret.append(("Perihilion", toScientificNotation(value: perihelion!.converted(LengthUnit.kilometer).rounded(7).amount), " km"))
        }
        if aphelion != nil{
            ret.append(("Aphelion", toScientificNotation(value: aphelion!.converted(LengthUnit.kilometer).rounded(7).amount), " km"))
        }
        if inclination != nil{
            ret.append(("Orbital Tilt", String(describing: inclination!), " degrees"))
        }
        if eccentricity != nil{
            ret.append(("Eccentricity", String(describing: eccentricity!), ""))
        }
        if equator_inclination != nil{
            ret.append(("Equator Tilt", String(describing: equator_inclination!), " degrees"))
        }
        if min_distance_from_earth != nil{
            ret.append(("Nearest to Earth", toScientificNotation(value: min_distance_from_earth!.converted(LengthUnit.kilometer).rounded(7).amount), " km"))
        }
        if max_distance_from_earth != nil{
            ret.append(("Farthest from Earth", toScientificNotation(value: max_distance_from_earth!.converted(LengthUnit.kilometer).rounded(7).amount), " km"))
        }
        
        return ret
    }
    
    func generateMiscObjects() -> [(String, String)] {
        var ret = [(String, String)]()
        
        ret.append(("Moons",String(describing: moons.count)))
        
        if rings.count > 0 {
            ret.append(("Ring System", "Yes"))
        } else {
            ret.append(("Ring System", "No"))
        }
        
        ret.append(("Type", type.rawValue))
        
        ret.append(("Position from sun", String(describing: position)))
        
        if discovered != nil{
            ret.append(("Date of discovery", discovered!))
        }
        
        return ret
    }

}


