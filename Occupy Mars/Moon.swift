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

class Moon {
    
    //--------------------------------------------settings
    
    let defaults = UserDefaults.standard
    
    //--------------------------------------------meta
    
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
    
    //--------------------------------------------orbit - notes: use tropical orbit, mean orbital velocity, obliquidy from orbit for equator inclination, and inclination from eliptic for inclination
    
    var orbital_length: Quantity?,
    perigee: Quantity?,
    apogee: Quantity?,
    velocity: Quantity?,
    inclination: Double?,
    eccentricity: Double?,
    day_length: Quantity?,
    equator_inclination: Double?
    
    //--------------------------------------------atmosphere
    
    var surface_pressure: Double?,
    average_temperature: Double?,
    total_mass: Quantity?
    var composition = [(gas: String,
                        ppm: Double)]()
    
    //--------------------------------------------miscelanious
    
    var discovered: String?
    
    //--------------------------------------------visual
    
    var texture: String?,
    model: String?,
    normalmap: String?
    
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
    
    func misc(discovered: String?) {
        self.discovered = discovered
        self.hasDetails = true
    }
    
    func display(texture: String?,
                 model: String?,
                 normalmap: String?) {
        self.texture = texture
        self.model = model
        self.normalmap = normalmap
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
        
        planet = SCNSphere(radius: 1.0)
        
        if let let_model = model {
            let tempScene = SCNScene(named: let_model)
            print(tempScene ?? "")
            let geometry = tempScene?.rootNode.childNodes[0]
            geometry?.name = "planet"
            
            //let rotationNode = SCNNode()
            ///rotationNode.geometry = nil
            //rotationNode.addChildNode(planetNode)
            //scene.rootNode.addChildNode(rotationNode)
            
            let spin = CABasicAnimation(keyPath: "rotation")
            spin.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
            spin.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2 * Double.pi)))
            
            if let let_day_length = day_length {
                spin.duration = let_day_length.converted(TimeUnit.minute).amount.doubleValue/24
            } else {
                spin.duration = 60
            }
            
            spin.repeatCount = .infinity
            geometry?.addAnimation(spin, forKey: "spin around")

            
            scene.rootNode.addChildNode(geometry!)
            //var box = planet.boundingBox
            //planet.boundingBox.min.x = box.min.x*0.8
            //planet.boundingBox.min.y = box.min.y*0.8
            //planet.boundingBox.min.z = box.min.z*0.8
            //planet.boundingBox.max.x = box.max.x*0.8
            //planet.boundingBox.max.y = box.max.y*0.8
            //planet.boundingBox.max.z = box.max.z*0.8
            //planet = tempScene!.rootNode.childNodes[0].geometry! //= SCNGeometry  //(sources: [SCNGeometrySource], elements: <#T##[SCNGeometryElement]#>)
        } else {
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
            
//            if (ProcessInfo.processInfo.physicalMemory/1024/1024 > 1536) {
                if let let_normalmap = normalmap {
                    if size == Size.small {
                        //material.normal.contents = UIImage(named: String(let_normalmap.characters.dropLast(4)) + " - thumbnail.jpg")!
                    } else {
                        material.normal.contents = resizeImage(UIImage(named: let_normalmap)!, newHeight: CGFloat(size.rawValue))
                    }
                }
//            } else {
//                print("device has less than a giga and a half of memory, ignoring normal map")
//            }
            
            planet.materials = [material]
            let planetNode = SCNNode(geometry: planet)
            planetNode.name = "planet"
            //var box = planet.boundingBox
            //planet.boundingBox.min.x = box.min.x*0.8
            //planet.boundingBox.min.y = box.min.y*0.8
            //planet.boundingBox.min.z = box.min.z*0.8
            //planet.boundingBox.max.x = box.max.x*0.8
            //planet.boundingBox.max.y = box.max.y*0.8
            //planet.boundingBox.max.z = box.max.z*0.8
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
            
            if size == Size.full {
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
                rotationNode.rotation = SCNVector4(x: 0, y: 0, z: 1, w: Float(let_equator_inclination.degreesToRadians))
                //rotationNode.boundingBox = box
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
            
            print(rotationNode.pivot)
            
        }
        
        if texture != nil || model != nil {
            return scene
        } else{
            return nil
        }
    }
    
    func getPrettyVisibility() -> String {
        return "Visible Tonight"
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
        
        let scale: Int16 = 6
        let behavior = NSDecimalNumberHandler(roundingMode: .plain, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        
        if (defaults.bool(forKey: "useImperial")) {
            if mass != nil{
                ret.append(("Mass", toScientificNotation(value: mass!.converted(MassUnit.pound).rounded(6).amount), " lb"))
            }
            if volume != nil{
                ret.append(("Volume", toScientificNotation(value: volume!.converted(LengthUnit.mile).rounded(6).amount), " mi³"))
            }
            if density != nil{
                ret.append(("Density", toScientificNotation(value: density!.converted(MassUnit.kilogram).amount.dividing(by:16.02).rounding(accordingToBehavior: behavior)), " lb/ft³"))  //THIS ONE IS SPECIAL
            }
            if equatorial != nil{
                ret.append(("Radius", toScientificNotation(value: equatorial!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
            if gravity != nil{
                ret.append(("Gravity", toScientificNotation(value: gravity!.converted(LengthUnit.foot).rounded(6).amount), " ft/s²"))
            }
            if escape_velocity != nil{
                ret.append(("Escape Velocity", toScientificNotation(value: escape_velocity!.converted(LengthUnit.mile).rounded(6).amount), " mi/s"))
            }
            if irradiance != nil{
                let value = NSDecimalNumber.init(value: irradiance!/10.7639105)
                ret.append(("Irradiance", String(describing: value.rounding(accordingToBehavior: behavior)), " W/ft²"))
            }
            if geographic_height_variance != nil{
                ret.append(("Height Variance", toScientificNotation(value: geographic_height_variance!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
        } else {
            if mass != nil{
                ret.append(("Mass", toScientificNotation(value: mass!.converted(MassUnit.kilogram).rounded(6).amount), " kg"))
            }
            if volume != nil{
                ret.append(("Volume", toScientificNotation(value: volume!.converted(LengthUnit.kilometer).rounded(6).amount), " km³"))
            }
            if density != nil{
                ret.append(("Density", toScientificNotation(value: density!.converted(MassUnit.kilogram).rounded(6).amount), " kg/m³"))
            }
            if equatorial != nil{
                ret.append(("Radius", toScientificNotation(value: equatorial!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
            if gravity != nil{
                ret.append(("Gravity", toScientificNotation(value: gravity!.converted(LengthUnit.meter).rounded(6).amount), " m/s²"))
            }
            if escape_velocity != nil{
                ret.append(("Escape Velocity", toScientificNotation(value: escape_velocity!.converted(LengthUnit.kilometer).rounded(6).amount), " km/s"))
            }
            if irradiance != nil{
                ret.append(("Irradiance", String(describing: irradiance!), " W/m²"))
            }
            if geographic_height_variance != nil{
                ret.append(("Height Variance", toScientificNotation(value: geographic_height_variance!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
        }
        return ret
    }
    
    func generateOrbitalObjects() -> [(String, String, String)] {
        var ret = [(String, String, String)]()
        
        if orbital_length != nil{
            ret.append(("Year Length", toScientificNotation(value: orbital_length!.converted(TimeUnit.day).rounded(6).amount), " days")) //for some reason, this library does not convert days properly
        }
        if day_length != nil{
            ret.append(("Day Length", toScientificNotation(value: day_length!.converted(TimeUnit.hour).rounded(6).amount), " hours"))
        }
        
        if (defaults.bool(forKey: "useImperial")) {
            if velocity != nil{
                ret.append(("Average Velocity", toScientificNotation(value: velocity!.converted(LengthUnit.mile).rounded(6).amount), " mi/h"))
            }
            if perigee != nil{
                ret.append(("Perihilion", toScientificNotation(value: perigee!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
            if apogee != nil{
                ret.append(("Aphelion", toScientificNotation(value: apogee!.converted(LengthUnit.mile).rounded(6).amount), " mi"))
            }
        } else {
            if velocity != nil{
                ret.append(("Average Velocity", toScientificNotation(value: velocity!.converted(LengthUnit.kilometer).rounded(6).amount), " km/h"))
            }
            if perigee != nil{
                ret.append(("Perihilion", toScientificNotation(value: perigee!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
            if apogee != nil{
                ret.append(("Aphelion", toScientificNotation(value: apogee!.converted(LengthUnit.kilometer).rounded(6).amount), " km"))
            }
        }
        
        if inclination != nil{
            ret.append(("Orbital Tilt", String(describing: inclination!), " degrees"))
        }
        if eccentricity != nil{
            ret.append(("Eccentricity", String(describing: eccentricity!), ""))
        }
        if equator_inclination != nil{
            ret.append(("Equatorial Tilt", String(describing: equator_inclination!), " degrees"))
        }
        
        return ret
    }
    
    func generateMiscObjects() -> [(String, String)] {
        var ret = [(String, String)]()
        
        ret.append(("Position from Orbiting Planet", position))
        
        if discovered != nil{
            ret.append(("Date of Discovery", discovered!))
        }
        
        return ret
    }
    
}


