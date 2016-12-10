//
//  GlobeViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/12/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit
import SceneKit

class GlobeViewController: UIViewController {
    @IBOutlet weak var globe: SCNView!
    
    var planet: Planet!
    
    var lastWidthRatio: Float = 0
    var lastHeightRatio: Float = 0
    //var lastOrtho: Double = 0
    
    var ortho: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let let_scene = planet.getScene(Size.full) {
            globe.scene = let_scene
            
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panDetected(sender:)));
            globe.addGestureRecognizer(panGesture);
            let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchDetected(sender:)))
            globe.addGestureRecognizer(pinchGesture)
            ortho = globe.scene?.rootNode.childNode(withName: "camera", recursively: true)?.camera?.orthographicScale
            //lastOrtho = ortho
            
            self.navigationItem.title = planet.name
        } else {
            self.navigationItem.title = "Error"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func stopMotion() {
        //print("stopping rotation")
        globe.scene?.rootNode.childNode(withName: "planet", recursively: true)?.pauseAnimation(forKey: "spin around")
    }
    
    func startMotion() {
        //print("starting rotation")
        globe.scene?.rootNode.childNode(withName: "planet", recursively: true)?.resumeAnimation(forKey: "spin around")
    }
    
    func panDetected(sender: UIPanGestureRecognizer) {
        stopMotion()
        //if lastOrtho != ortho {
            //lastWidthRatio *= Float(lastOrtho/Ortho)
            //lastHeightRatio *= Float(lastOrtho/ortho)
        //}
        let translation = sender.translation(in: sender.view!)
        let widthRatio = Float(translation.x) / Float(sender.view!.frame.size.width) + lastWidthRatio + Float(ortho)
        let heightRatio = Float(translation.y) / Float(sender.view!.frame.size.height) + lastHeightRatio + Float(ortho)
        print("Width Ratio \(widthRatio)")
        print("Height Ratio \(heightRatio)")
        print("Ortho \(ortho)")
        globe.scene?.rootNode.childNode(withName: "cameraOrbit", recursively: true)?.eulerAngles.y = Float(ortho * 0.7 * -M_PI) * widthRatio
        globe.scene?.rootNode.childNode(withName: "cameraOrbit", recursively: true)?.eulerAngles.x = Float(ortho * 0.7 * -M_PI * 2) * heightRatio
        
        //lastOrtho = ortho
        
        print(Float(-2 * M_PI) * widthRatio)
        if (sender.state == .ended) {
            lastWidthRatio = widthRatio
            lastHeightRatio = heightRatio
        }
    }
    
    func pinchDetected(sender: UIPinchGestureRecognizer) {
        stopMotion()
        let pinchVelocity = Double.init(sender.velocity)
        
        ortho = globe.scene?.rootNode.childNode(withName: "camera", recursively: true)?.camera?.orthographicScale
        
        print("Velocity \(pinchVelocity)")
        print("Ortho \(ortho)")
        
        globe.scene?.rootNode.childNode(withName: "camera", recursively: true)?.camera?.orthographicScale -= (pinchVelocity/20)
        
        if ortho! <= 0.1 && pinchVelocity > 0 {
            globe.scene?.rootNode.childNode(withName: "camera", recursively: true)?.camera?.orthographicScale = 0.1
        } else if ortho! >= 10.0 && pinchVelocity < 0 {
            globe.scene?.rootNode.childNode(withName: "camera", recursively: true)?.camera?.orthographicScale = 10.0
        }
        
        if (sender.state == .ended) {
            //lastWidthRatio *= Float(ortho)
            //lastHeightRatio *= Float(ortho)
        }
        
    } //http://stackoverflow.com/questions/33967838/scncamera-limit-arcball-rotation
}
