//
//  2dSky.swift
//  Occupy Mars
//
//  Created by Brandon Slaght on 12/26/17.
//  Copyright © 2017 Slaght, Brandon. All rights reserved.
//
import UIKit
import CoreLocation
import SceneKit

import SwiftAA

class FlatSkyViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    var uranusView: SCNView!
    var tooltip: SexyTooltip!
    var hasUpdatedHeading = false
    @IBOutlet weak var compass: UIView!
    @IBOutlet weak var skybox: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //update compass
        locationManager = (tabBarController as! TabBarViewController).locationManager.locationManager
        locationManager.delegate = self
        
        //set up background
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.layer.zPosition = -1
        blurView.isUserInteractionEnabled = false
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "milkyway.jpg")!)
        self.view.addSubview(blurView)
        self.view.bringSubview(toFront: compass)
        
        //set up planets
        let uranus = Uranus.init(julianDay: JulianDay.init(Date.init()))
        print(uranus.riseTransitSetTimes(for: GeographicCoordinates.init(CLLocation.init(latitude: CLLocationDegrees.init(exactly: 41.4053756783647)!, longitude: CLLocationDegrees.init(exactly: -81.6643093985837)!))).setTime?.date)
        print(uranus.equatorialCoordinates.makeHorizontalCoordinates(for: GeographicCoordinates.init(CLLocation.init(latitude: CLLocationDegrees.init(exactly: 41.4053756783647)!, longitude: CLLocationDegrees.init(exactly: -81.6643093985837)!)), at: JulianDay.init(Date.init())))
        
        //add planets to compass
        let uranusObject = Objects.planets()[.Major]![6]
        let uranusModel = uranusObject.getScene(size: .small)
        uranusView = SCNView()
        uranusView.scene = uranusModel
        uranusView.backgroundColor = UIColor.clear
        uranusView.frame = CGRect(x: 250, y: 250, width: 100, height: 100)
        uranusView.antialiasingMode = .multisampling4X
        compass.addSubview(uranusView)
        
        //add tooltips to planets
        let viewNib = UINib(nibName: "PlanetTooltip", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? PlanetTooltipController
        viewNib?.layoutSubviews()
        viewNib?.sizeToFit()
        viewNib?.layoutSubviews()
        tooltip = SexyTooltip.init(contentView: viewNib)
        tooltip.hasShadow = true
        tooltip.color = UIColor.darkGray
        self.view.addSubview(tooltip)
        tooltip.present(from: uranusView, in: self.view)
        
        //add gesture recognizers to tooltip
        //let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.segueToPlanetView (_:)))
    
        //add skybox
        let skyboxScene = SCNScene()
        let skyBox = SCNSphere(radius: 1)
        skyBox.segmentCount = 80
        
        let sky = SCNMaterial()
        sky.diffuse.contents = UIImage(named: "sky.jpg")!
        sky.diffuse.mipFilter = SCNFilterMode.linear
        sky.isDoubleSided = true
        
        skyBox.materials = [sky]
        let skyNode = SCNNode(geometry: skyBox)
        skyboxScene.rootNode.addChildNode(skyNode)
        skybox.antialiasingMode = .multisampling4X
        skybox.scene = skyboxScene
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.barTintColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
    }
    
    func segueToPlanetView(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "planetSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "planetSegue", let destination = segue.destination as? UINavigationController {
            let detail = destination.topViewController as? DetailViewController
            //detail?.body = Objects.objects[classification]![indexPath.row]
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        //print(newHeading.magneticHeading)
        if(!hasUpdatedHeading) {
            self.directlyUpdateHeading(manager, didUpdateHeading: newHeading)
            hasUpdatedHeading = true
        } else {
            UIView.animate(withDuration: 0.25) {
                self.directlyUpdateHeading(manager, didUpdateHeading: newHeading)
            }
        }
    }
    
    func directlyUpdateHeading(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.compass.transform = CGAffineTransform(rotationAngle: -CGFloat(newHeading.trueHeading * Double.pi / 180))
        
        //rotate all the planets the opposite direction
        self.uranusView.transform = CGAffineTransform(rotationAngle: CGFloat(newHeading.trueHeading * Double.pi / 180))
        //tooltip.present(from: CGPoint(x: uranusView.bounds.size.width*0.5, y: uranusView.bounds.size.height*0.5 - 25), in: uranusView, containedBy: self.view)
        
        //re-align the tooltip
        self.tooltip.present(from: CGPoint(x: self.compass.convert(self.uranusView.frame, to: self.view).midX, y: self.compass.convert(self.uranusView.frame, to: self.view).midY - 25), in: self.view, animated: false)
        //print("x: " + String(describing: self.compass.convert(self.uranusView.bounds, to: self.view).midX))
        //print("y: " + String(describing: self.compass.convert(self.uranusView.bounds, to: self.view).midY))
        //self.tooltip.positionTooltip(for: SexyTooltipArrowDirection.down, aroundRect: self.uranusView.frame, in: self.view, force: false)
    }
}
