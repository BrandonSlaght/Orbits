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
    
    var mass: Int?,
        volume: Int?,
        equatorial: Double?,
        density: Double?,
        gravity: Double?,
        escape_velocity: Double?,
        irradiance: Double?,
        geographic_height_variance: Int?
    
    //--------------------------------------------orbit - notes: use tropical orbit, mean orbital velocity, and obliquidy from orbit for equator inclination
    
    var year_length: Double?,
        perihelion: Double?,
        aphelion: Double?,
        velocity: Double?,
        inclination: Double?,
        eccentricity: Double?,
        day_length: Double?,
        equator_inclination: Double?,
        min_distance_from_earth: Double?,
        max_distance_from_earth: Double?
    
    //--------------------------------------------atmosphere
    
    //var surface_pressure, average_temperature, total_mass
    //var composition [(gas: String, ppm: int)]
    
    //--------------------------------------------moons
    
    var moons = [Moon]()
    
    //--------------------------------------------rings
    
    var rings = [(name: String,
                width: Int,
                thickness: Int,
                density: Int)]()
    
    //--------------------------------------------visual
    
    var texture: String?,
        model: String?,
        normalmap: String?
    
    //--------------------------------------------media
    
    var images = [String]()
    var videos = [String]()
    
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
    
    func about(_ description: String?,
                     wiki: String?,
                     nasa: String?) {
        self.description = description
        self.wiki = wiki
        self.nasa = nasa
    }
    
    func geology(mass: Int?,
                 volume: Int?,
                 equatorial: Double?,
                 density: Double?,
                 gravity: Double?,
                 escape_velocity: Double?,
                 irradiance: Double?,
                 geographic_height_variance: Int?) {
        self.mass = mass
        self.volume = volume
        self.equatorial = equatorial
        self.density = density
        self.gravity = gravity
        self.escape_velocity = escape_velocity
        self.irradiance = irradiance
        self.geographic_height_variance = geographic_height_variance
    }
    
    func orbitals(_ year_length: Double?,
                  perihelion: Double?,
                  aphelion: Double?,
                  velocity: Double?,
                  inclination: Double?,
                  eccentricity: Double?,
                  day_length: Double?,
                  equator_inclination: Double?,
                  min_distance_from_earth: Double?,
                  max_distance_from_earth: Double?) {
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
    
    func display(_ texture: String?,
                 model: String?,
                 normalmap: String? ) {
        self.texture = texture
        self.model = model
        self.normalmap = normalmap
    }
    
    func images(_ images: [String]) {
        self.images = images
    }
    
    //--------------------------------------------helpers
    
    func getScene(_ size: Size) -> SCNScene? {
        
        let scene = SCNScene()
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLight.LightType.ambient
        ambientLightNode.light!.color = UIColor(white: 0.33, alpha: 1.0)
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
            material.diffuse.contents = resizeImage(UIImage(named: let_texture)!, newHeight: CGFloat(size.rawValue))
            material.diffuse.mipFilter = SCNFilterMode.linear
            
            if let let_normalmap = normalmap {
                material.normal.contents = resizeImage(UIImage(named: let_normalmap)!, newHeight: CGFloat(size.rawValue))
            }
            
            planet.materials = [material]
            let planetNode = SCNNode(geometry: planet)
            planetNode.name = "planet"
            let rotationNode = SCNNode()
            rotationNode.addChildNode(planetNode)
            scene.rootNode.addChildNode(rotationNode)
            
            let spin = CABasicAnimation(keyPath: "rotation")
            spin.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
            spin.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2 * M_PI)))
            
            if let let_day_length = day_length {
                spin.duration = 60*(let_day_length/24)
            } else {
                spin.duration = 60
            }
            
            
            spin.repeatCount = .infinity
            planetNode.addAnimation(spin, forKey: "spin around")
            
            if size == Size.full {
                print("FULL")
                let camera = SCNCamera()
                camera.usesOrthographicProjection = true
                camera.orthographicScale = 1.5
                camera.zNear = 0
                camera.zFar = 80
                let cameraNode = SCNNode()
                cameraNode.name = "camera"
                cameraNode.position = SCNVector3(x: 0, y: 0, z: 20)
                cameraNode.camera = camera
                let cameraOrbit = SCNNode()
                cameraOrbit.name = "cameraOrbit"
                cameraOrbit.addChildNode(cameraNode)
                scene.rootNode.addChildNode(cameraOrbit)
                
                // rotate it (I've left out some animation code here to show just the rotation)
                //cameraOrbit.eulerAngles.x -= Float(M_PI_4)
                //cameraOrbit.eulerAngles.y -= Float(M_PI_4*3)
            }
            
            if let let_equator_inclination = equator_inclination {
                //rotationNode.rotation = (SCNVector4: SCNVector4(x: 0, y: 0, z: 1, w: Float(let_equator_inclination.degreesToRadians)))
                //let shrink_factor = 1 + Float(let_equator_inclination.degreesToRadians)
                //print(shrink_factor)
                //planetNode.scale = (SCNVector3: SCNVector3(x: 50, y: 50, z: 50))
                //planetNode.scale = (SCNVector3: SCNVector3(x: shrink_factor, y: shrink_factor, z: shrink_factor))
                //rotationNode.scale = (SCNVector3: SCNVector3(x: shrink_factor, y: shrink_factor, z: shrink_factor))
            }
            
        } else {
            return nil
        }
        
        return scene
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
    
    func generateGeologyObjects() -> [(String, String)] {
        var ret = [(String, String)]()
        
        if mass != nil{
            ret.append(("Mass",String(describing: mass!)+" kg"))
        }
        if volume != nil{
            ret.append(("Volume", String(describing: volume!)+" km³"))
        }
        if density != nil{
            ret.append(("Density", String(describing: density!)))
        }
        if equatorial != nil{
            ret.append(("Radius", String(describing: equatorial!)+" km"))
        }
        if gravity != nil{
            ret.append(("Gravity", String(describing: gravity!)+" m/s²"))
        }
        if escape_velocity != nil{
            ret.append(("Escape Velocity", String(describing: escape_velocity!)+" m/s"))
        }
        if irradiance != nil{
            ret.append(("Irradiance", String(describing: irradiance!)+" lumens"))
        }
        if geographic_height_variance != nil{
            ret.append(("Height Variance", String(describing: geographic_height_variance!)+" km"))
        }
        
        return ret
    }
    
    func generateOrbitalObjects() -> [(String, String)] {
        var ret = [(String, String)]()
        
        if year_length != nil{
            ret.append(("Year Length",String(describing: year_length!)+" days"))
        }
        if day_length != nil{
            ret.append(("Day Length", String(describing: day_length!)+" hours"))
        }
        if velocity != nil{
            ret.append(("Average Velocity", String(describing: velocity!)+" km/h"))
        }
        if perihelion != nil{
            ret.append(("Perihilion", String(describing: perihelion!)+" km"))
        }
        if aphelion != nil{
            ret.append(("Aphelion", String(describing: aphelion!)+" km"))
        }
        if inclination != nil{
            ret.append(("Orbital Tilt", String(describing: inclination!)+" degrees"))
        }
        if eccentricity != nil{
            ret.append(("Eccentricity", String(describing: eccentricity!)+" km"))
        }
        if equator_inclination != nil{
            ret.append(("Equator Tilt", String(describing: equator_inclination!)+" degrees"))
        }
        if min_distance_from_earth != nil{
            ret.append(("Nearest to Earth", String(describing: min_distance_from_earth!)+" km"))
        }
        if max_distance_from_earth != nil{
            ret.append(("Farthest from Earth", String(describing: max_distance_from_earth!)+" km"))
        }
        
        return ret
    }
}


