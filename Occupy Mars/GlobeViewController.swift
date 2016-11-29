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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let let_scene = planet.getScene(Size.full) {
            globe.scene = let_scene
//            globe.z
            self.navigationItem.title = planet.name
        } else {
            self.navigationItem.title = "Error"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
