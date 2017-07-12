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
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var rotate: UIButton!
    @IBAction func press(_ sender: UIButton) {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 1.0
        SCNTransaction.animationTimingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        globe.pointOfView? = camera
        SCNTransaction.commit()
        globe.isPlaying = true
    }
    
    @IBAction func stopRotation(_ sender: Any) {
        if rotating {
            rotating = false
            rotate.setImage(UIImage(named: "icon-rotation-off"), for: UIControlState.normal)
            stopMotion()
        } else {
            rotating = true
            rotate.setImage(UIImage(named: "icon-rotation-on"), for: UIControlState.normal)
            startMotion()
        }
    }
    
    var split: UISplitViewController!
    
    var rotating = true
    
    var body: Body!
    var camera: SCNNode!
    
    var barColor: UIColor!
    var barImage: UIImage!
    var barBackground: UIImage!
    
    var primaryWidth = CGFloat(100)
    
    //var lastWidthRatio: Float = 0
    //var lastHeightRatio: Float = 0
    //var lastOrtho: Double = 0
    
    //var ortho: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let let_scene = body.getScene(size: Size.full) {
            globe.antialiasingMode = .multisampling4X
            globe.scene = let_scene
            
//            let sky = SCNSphere(radius: 2.0)
//            sky.segmentCount = 100
//            let skymap = SCNMaterial()
//            skymap.diffuse.contents = UIImage(named: "sky.jpg")
//            skymap.isDoubleSided = true
//            skymap.diffuse.mipFilter = SCNFilterMode.linear
//            sky.materials.append(skymap)
//            let skynode = SCNNode(geometry: sky)
//            globe.pointOfView?.addChildNode(skynode)
//            
            
            //globe.scene?.background.contents = UIImage(named: "sky.jpg")
            //globe.scene?.rootNode.childNodes.first.
            //let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panDetected(sender:)));
            //globe.addGestureRecognizer(panGesture);
            //let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchDetected(sender:)))
            //globe.addGestureRecognizer(pinchGesture)
            //ortho = globe.scene?.rootNode.childNode(withName: "camera", recursively: true)?.camera?.orthographicScale
            //lastOrtho = ortho
        
        } else {
            self.navigationItem.title = "Error"
        }
    
        
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            print(self.splitViewController?.primaryColumnWidth ?? "ERROR UNWRAPPING COLUMN WIDTH")
//            primaryWidth = (self.splitViewController?.primaryColumnWidth)!
//            self.splitViewController?.maximumPrimaryColumnWidth = 0
//        }
        
        split = self.splitViewController!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        globe.pointOfView?.position.z = 5
        globe.pointOfView?.camera?.motionBlurIntensity = 1.0
        globe.pointOfView?.camera?.wantsHDR = true
        globe.pointOfView?.camera?.bloomIntensity = 1.0
        
        let skyBox = SCNSphere(radius: 15)
        skyBox.segmentCount = 80
        
        let sky = SCNMaterial()
        sky.diffuse.contents = UIImage(named: "sky.jpg")!
        sky.diffuse.mipFilter = SCNFilterMode.linear
        sky.isDoubleSided = true
        
        skyBox.materials = [sky]
        let skyNode = SCNNode(geometry: skyBox)
        skyNode.name = "skyBox"
        skyNode.position = SCNVector3(0, 0, 0)
        globe.pointOfView?.addChildNode(skyNode)

        camera = SCNNode()
        camera.camera = SCNCamera()
        camera.position = SCNVector3(0.0, 0.0, 5.0)
        camera.name = "default camera"
        camera.position.z = 5
        camera.camera?.motionBlurIntensity = 1.0
        camera.camera?.wantsHDR = true
        camera.camera?.bloomIntensity = 1.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        var navBar: UINavigationBar
        if splitViewController?.secondaryViewController != nil {
            navBar = (navigationController?.navigationBar)!

            //navigationController?.navigationBar.barTintColor = UIColor.clear
        } else {
            navBar = (self.splitViewController?.primaryViewController as! UINavigationController).navigationBar
        }
        //barColor = navBar.barTintColor
        barImage = navBar.shadowImage
        barBackground = navBar.backgroundImage(for: UIBarMetrics.default)
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        //navBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        var navBar: UINavigationBar
        if splitViewController?.secondaryViewController != nil {
            navBar = (navigationController?.navigationBar)!
            
            //navigationController?.navigationBar.barTintColor = UIColor.clear
        } else {
            navBar = (self.splitViewController?.primaryViewController as! UINavigationController).navigationBar
        }

        //navBar.barTintColor = barColor
        navBar.shadowImage = barImage
        navBar.setBackgroundImage(barBackground, for: UIBarMetrics.default)
        //navBar.isTranslucent = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            print(self.splitViewController?.primaryColumnWidth ?? "ERROR UNWRAPPING COLUMN WIDTH")
//            self.splitViewController?.maximumPrimaryColumnWidth = primaryWidth + 1
//            self.splitViewController?.minimumPrimaryColumnWidth = primaryWidth
//        }
        //if self.splitViewController?.secondaryViewController != nil {
        print ("here in view did dissapear")
        split.toggleMasterView()
        //}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        stopMotion()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if rotating {
            startMotion()
        }
    }
    
    func stopMotion() {
        globe.scene?.rootNode.childNode(withName: "planet", recursively: true)?.pauseAnimation(forKey: "spin around")
    }
    
    func startMotion() {
        globe.scene?.rootNode.childNode(withName: "planet", recursively: true)?.resumeAnimation(forKey: "spin around")
    }
    
    func panDetected(sender: UIPanGestureRecognizer) {
        stopMotion()
        var i = 0
        for gesture in globe.gestureRecognizers! {
            print(i)
            i += 1
            print(gesture.isEnabled)
        }
        //if lastOrtho != ortho {
            //lastWidthRatio *= Float(lastOrtho/Ortho)
            //lastHeightRatio *= Float(lastOrtho/ortho)
        //}
//        let translation = sender.translation(in: sender.view!)
//        let widthRatio = Float(translation.x) / Float(sender.view!.frame.size.width) + lastWidthRatio + Float(ortho)
//        let heightRatio = Float(translation.y) / Float(sender.view!.frame.size.height) + lastHeightRatio + Float(ortho)
//        print("Width Ratio \(widthRatio)")
//        print("Height Ratio \(heightRatio)")
//        print("Ortho \(ortho)")
//        globe.scene?.rootNode.childNode(withName: "cameraOrbit", recursively: true)?.eulerAngles.y = Float(ortho * 0.7 * -M_PI) * widthRatio
//        globe.scene?.rootNode.childNode(withName: "cameraOrbit", recursively: true)?.eulerAngles.x = Float(ortho * 0.7 * -M_PI * 2) * heightRatio
//        
//        //lastOrtho = ortho
//        
//        print(Float(-2 * M_PI) * widthRatio)
//        if (sender.state == .ended) {
//            lastWidthRatio = widthRatio
//            lastHeightRatio = heightRatio
//        }
    }
    
    func pinchDetected(sender: UIPinchGestureRecognizer) {
        stopMotion()

//        let pinchVelocity = Double.init(sender.velocity)
//        
//        ortho = globe.scene?.rootNode.childNode(withName: "camera", recursively: true)?.camera?.orthographicScale
//        
//        print("Velocity \(pinchVelocity)")
//        print("Ortho \(ortho)")
//        
//        globe.scene?.rootNode.childNode(withName: "camera", recursively: true)?.camera?.orthographicScale -= (pinchVelocity/20)
//        
//        if ortho! <= 0.1 && pinchVelocity > 0 {
//            globe.scene?.rootNode.childNode(withName: "camera", recursively: true)?.camera?.orthographicScale = 0.1
//        } else if ortho! >= 10.0 && pinchVelocity < 0 {
//            globe.scene?.rootNode.childNode(withName: "camera", recursively: true)?.camera?.orthographicScale = 10.0
//        }
//        
//        if (sender.state == .ended) {
//            //lastWidthRatio *= Float(ortho)
//            //lastHeightRatio *= Float(ortho)
//        }
        
    } //http://stackoverflow.com/questions/33967838/scncamera-limit-arcball-rotation
}
