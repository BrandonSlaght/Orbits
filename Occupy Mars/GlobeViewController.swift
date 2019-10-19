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
        SCNTransaction.animationTimingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
        globe.pointOfView? = camera
        SCNTransaction.commit()
        globe.isPlaying = true
    }
    
    @IBAction func stopRotation(_ sender: Any) {
        if rotating {
            rotate.setImage(UIImage(named: "icon-rotation-off"), for: UIControl.State.normal)
            stopMotion()
        } else {
            rotate.setImage(UIImage(named: "icon-rotation-on"), for: UIControl.State.normal)
            startMotion()
        }
        rotating = !rotating
    }
    
    var split: UISplitViewController!
    var body: Body!
    var camera: SCNNode!
    var barColor: UIColor!
    var barImage: UIImage!
    var barBackground: UIImage!
    var primaryWidth = CGFloat(100)
    var rotating = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let let_scene = body.getScene(size: Size.full) {
            globe.antialiasingMode = .multisampling4X
            globe.scene = let_scene
            globe.scene?.background.contents = UIImage(named: "sky.jpg")
        } else {
            self.navigationItem.title = "Error"
        }
        split = self.splitViewController!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        globe.pointOfView?.position = SCNVector3(0.0, 0.0, 5.0)
        globe.pointOfView?.position.z = 5
        
        camera = globe.pointOfView?.clone()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //split.toggleMasterView()
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
        globe.scene?.rootNode.childNode(withName: "planet", recursively: true)?.animationPlayer(forKey: "spin around")?.paused = true//pauseAnimation(forKey: )
    }
    
    func startMotion() {
        globe.scene?.rootNode.childNode(withName: "planet", recursively: true)?.animationPlayer(forKey: "spin around")?.paused = false
    }
}
