//
//  moon.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/29/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import Foundation
import SceneKit

// notes: use metric and kelvin

class Moon {
    
    //--------------------------------------------general
    
    var name: String,
    position: Int
    
    //--------------------------------------------geology - notes: use equatorial radius and mean density and surface gravity / acceleration
    
    //    var mass: Int,
    //        volume: Int,
    //        equatorial: Double,
    //        density: Double,
    //        gravity: Double,
    //        escape_velocity: Double,
    //        irradiance: Double,
    //        geographic_height_variance: Int
    
    //--------------------------------------------orbit - notes: use tropical orbit, mean orbital velocity, and obliquidy from orbit for equator inclination
    
    var orbital_period: Double?,
    velocity: Double?,
    inclination: Double?,
    eccentricity: Double?,
    rotation_length: Double?,
    equator_inclination: Double?,
    distance_from_planet: Double?
    
    //--------------------------------------------atmosphere
    
    //var surface_pressure, average_temperature, total_mass
    //var composition [(gas: String, ppm: int)]
    
    
    //--------------------------------------------visual
    
    var texture: String?,
    model: String?,
    normalmap: String?
    
    //--------------------------------------------initializers
    
    init(name: String,
         position: Int) {
        self.name = name
        self.position = position
    }
    
    func orbitals(_ orbital_period: Double?,
                  velocity: Double?,
                  inclination: Double?,
                  eccentricity: Double?,
                  rotation_length: Double?,
                  equator_inclination: Double?,
                  distance_from_planet: Double?) {
        self.orbital_period = orbital_period
        self.velocity = velocity
        self.inclination = inclination
        self.eccentricity = eccentricity
        self.rotation_length = rotation_length
        self.equator_inclination = equator_inclination
        self.distance_from_planet = distance_from_planet
    }
    
    func display(_ texture: String?,
                 model: String?,
                 normalmap: String? ) {
        self.texture = texture
        self.model = model
        self.normalmap = normalmap
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
            //print(tempScene!.rootNode.childNodes.count)
            planet = tempScene!.rootNode.childNodes[0].geometry!//= SCNGeometry  //(sources: [SCNGeometrySource], elements: <#T##[SCNGeometryElement]#>)
        } else {
            planet = SCNSphere(radius: 1.0)
            (planet as! SCNSphere).segmentCount = 40
        }
        
        if let let_texture = texture {
            
            let material = SCNMaterial()
            material.diffuse.contents = resizeImage(UIImage(named: let_texture)!, newHeight: CGFloat(size.rawValue))
            material.diffuse.mipFilter = SCNFilterMode.linear
            
            if let let_normalmap = normalmap {
                material.normal.contents = resizeImage(UIImage(named: let_normalmap)!, newHeight: CGFloat(size.rawValue))
            }

            planet.firstMaterial = material
            let planetNode = SCNNode(geometry: planet)
            let rotationNode = SCNNode()
            rotationNode.addChildNode(planetNode)
            scene.rootNode.addChildNode(rotationNode)
            
            let spin = CABasicAnimation(keyPath: "rotation")
            spin.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
            spin.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2 * M_PI)))
            
            if let let_day_length = rotation_length {
                spin.duration = 30 * (let_day_length/24)
            } else {
                spin.duration = 30
            }
            
            spin.repeatCount = .infinity
            planetNode.addAnimation(spin, forKey: "spin around")
            
            if let let_equator_inclination = equator_inclination {
                rotationNode.rotation = (SCNVector4: SCNVector4(x: 0, y: 0, z: 1, w: Float(let_equator_inclination.degreesToRadians)))
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
}


