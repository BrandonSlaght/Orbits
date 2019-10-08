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

class FlatSkyViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var compass: UIView!
    @IBOutlet weak var skybox: SCNView!
    var locationManager: CLLocationManager!
    var sextant: Sextant!
    var hasUpdatedHeading = false
    var hasUpdatedLocation = false
    var planetSceneBodyAndTooltipList = [(SCNView, Planet, SexyTooltip)]()
    
    var x = 250
    var y = 250
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.layer.zPosition = -1
        blurView.isUserInteractionEnabled = false
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "milkyway.jpg")!)
        self.view.addSubview(blurView)
        self.view.bringSubviewToFront(compass)
       
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
        
        sextant = (tabBarController as! TabBarViewController).locationManager
        //sextant.setCallbackFunction({})
        locationManager = sextant.locationManager
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.barTintColor = UIColor.Orbits.SpaceGray
    }
    
    func segueToPlanetView(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "planetSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if segue.identifier == "planetSegue", let destination = segue.destination as? UINavigationController {
            //let detail = destination.topViewController as? DetailViewController
            //detail?.body = Objects.objects[classification]![indexPath.row]
        //}
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            print("location not found!")
            return
        }
        
        print("in location manager")
        
        if(!hasUpdatedLocation) {
            print("initializing location for the first time")
            initializePlanetsAndScenes()
            hasUpdatedLocation = true
        }
        
        print("passed updating location")
        
        for planetTooltipTuple in planetSceneBodyAndTooltipList {
            if let aaPlanet = planetTooltipTuple.1.aa {
                let coords = GeographicCoordinates.init(location)
                let rstTimes = aaPlanet.riseTransitSetTimes(for: coords)
                
                if let let_tooltip = planetTooltipTuple.2.contentView as? PlanetTooltipController {
                    setRSTTimes(rise: rstTimes.riseTime?.date, set: rstTimes.setTime?.date, tooltip: let_tooltip)
                    
                }
            }
        }
    }
    
    func initializePlanetsAndScenes() {
        let mercury = Objects.mercury()
        let venus = Objects.venus()
        let mars = Objects.mars()
        let jupiter = Objects.jupiter()
        let saturn = Objects.saturn()
        let uranus = Objects.uranus()
        let neptune = Objects.neptune()
        let sun = Objects.sun()
        let moon = Objects.moon()
        
        buildPlanetAndTooltipModule(planet: mercury, selector: #selector(self.handleMercuryTap(rec:)))
        buildPlanetAndTooltipModule(planet: venus, selector: #selector(self.handleVenusTap(rec:)))
        buildPlanetAndTooltipModule(planet: mars, selector: #selector(self.handleMarsTap(rec:)))
        buildPlanetAndTooltipModule(planet: jupiter, selector: #selector(self.handleJupiterTap(rec:)))
        buildPlanetAndTooltipModule(planet: saturn, selector: #selector(self.handleSaturnTap(rec:)))
        buildPlanetAndTooltipModule(planet: uranus, selector: #selector(self.handleUranusTap(rec:)))
        buildPlanetAndTooltipModule(planet: neptune, selector: #selector(self.handleNeptuneTap(rec:)))
        buildPlanetAndTooltipModule(planet: sun, selector: #selector(self.handleSunTap(rec:)))
        buildPlanetAndTooltipModule(planet: moon, selector: #selector(self.handleMoonTap(rec:)))
    }
    
    func setRSTTimes(rise: Date?, set: Date?, tooltip: PlanetTooltipController) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        
        let dateFormatterWithDay = DateFormatter()
        dateFormatterWithDay.dateFormat = "h:mm a \n MMM d"
        
        if let riseTime = rise, let setTime = set {
            
            if ((riseTime.day != Date.init().day && riseTime.day != Date.init().day.advanced(by: 1))
                || (setTime.day != Date.init().day && setTime.day != Date.init().day.advanced(by: 1))) {
                tooltip.rises.text = dateFormatterWithDay.string(from: riseTime)
                tooltip.sets.text = dateFormatterWithDay.string(from: setTime)
                
                tooltip.rises.numberOfLines = 2
                tooltip.sets.numberOfLines = 2
            } else {
                tooltip.rises.text = dateFormatter.string(from: riseTime)
                tooltip.sets.text = dateFormatter.string(from: setTime)
            }
        }
    }
    
    func directlyUpdateHeading(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.compass.transform = CGAffineTransform(rotationAngle: -CGFloat(newHeading.trueHeading * Double.pi / 180))
        
        for planetTooltipTuple in planetSceneBodyAndTooltipList {
            //planetTooltipTuple.0.transform = CGAffineTransform(rotationAngle: CGFloat(newHeading.trueHeading * Double.pi / 180))
            if(planetTooltipTuple.2.isShowing) {
                planetTooltipTuple.2.present(from: CGPoint(x: self.compass.convert(planetTooltipTuple.0.frame, to: self.view).midX, y: self.compass.convert(planetTooltipTuple.0.frame, to: self.view).midY - 25), in: self.view, animated: false)
            }
        }
    }
    
    func buildPlanetAndTooltipModule(planet: Planet, selector: Selector) {
        let planetScene = buildTinyPlanetScene(planet: planet)
        compass.addSubview(planetScene)
        
        let viewNib = buildTooltipNib()
        viewNib.setPlanet(planet: planet)
        let tooltip = buildTooltip(viewNib: viewNib)
        tooltip.dismiss()
        self.view.addSubview(tooltip)
        
        let gestureRec = UITapGestureRecognizer(target: self, action: selector)
        gestureRec.delegate = self
        planetScene.addGestureRecognizer(gestureRec)
        
        planetSceneBodyAndTooltipList.append((planetScene, planet, tooltip))
    }
    
    func buildTinyPlanetScene(planet: Planet) -> SCNView {
        let model = planet.getScene(size: .micro)
        let planetView = SCNView()
        planetView.scene = model
        planetView.backgroundColor = UIColor.clear
        planetView.frame = CGRect(x: self.x, y: self.y, width: 50, height: 50)
        planetView.antialiasingMode = .multisampling4X
        planetView.preferredFramesPerSecond = 15
        
        if let let_celestialBody = planet.aa, let let_location = locationManager.location {
            convertHorizontalCoordinatesToFrame(coordinates: let_celestialBody.equatorialCoordinates.makeHorizontalCoordinates(for: GeographicCoordinates.init(let_location), at: JulianDay.init(Date.init())))
        }
        
        x = x - 35
        y = y - 35
        
        return planetView
    }
    
    func convertHorizontalCoordinatesToFrame(coordinates: HorizontalCoordinates) -> CGRect {
        print(coordinates)
        let x = 1 * sin(coordinates.altitude.inRadians.value) * cos(coordinates.azimuth.inRadians.value)
        let y = 1 * sin(coordinates.altitude.inRadians.value) * sin(coordinates.azimuth.inRadians.value)
        let z = 1 * cos(coordinates.altitude.inRadians.value)
        print(x)
        print(y)
        print(z)
        
        return CGRect(x: 1, y: 1, width: 1, height: 1)
    }
    
    func buildTooltipNib() -> PlanetTooltipController {
        let viewNib = UINib(nibName: "PlanetTooltip", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PlanetTooltipController
        viewNib.layoutSubviews()
        viewNib.sizeToFit()
        viewNib.layoutSubviews()
        return viewNib
    }
    
    func buildTooltip(viewNib: PlanetTooltipController) -> SexyTooltip {
        let tooltip = SexyTooltip.init(contentView: viewNib)!
        tooltip.hasShadow = true
        tooltip.hasShadow = true
        tooltip.color = UIColor.darkGray
        return tooltip
    }
    
    @objc func handleMercuryTap(rec: UITapGestureRecognizer) {
        handleTap(rec: rec, tupleIndex: 0)
    }
    @objc func handleVenusTap(rec: UITapGestureRecognizer) {
        handleTap(rec: rec, tupleIndex: 1)
    }
    @objc func handleMarsTap(rec: UITapGestureRecognizer) {
        handleTap(rec: rec, tupleIndex: 2)
    }
    @objc func handleJupiterTap(rec: UITapGestureRecognizer) {
        handleTap(rec: rec, tupleIndex: 3)
    }
    @objc func handleSaturnTap(rec: UITapGestureRecognizer) {
        handleTap(rec: rec, tupleIndex: 4)
    }
    @objc func handleUranusTap(rec: UITapGestureRecognizer) {
        handleTap(rec: rec, tupleIndex: 5)
    }
    @objc func handleNeptuneTap(rec: UITapGestureRecognizer) {
        handleTap(rec: rec, tupleIndex: 6)
    }
    @objc func handleSunTap(rec: UITapGestureRecognizer) {
        handleTap(rec: rec, tupleIndex: 7)
    }
    @objc func handleMoonTap(rec: UITapGestureRecognizer) {
        handleTap(rec: rec, tupleIndex: 8)
    }
    
    
    func handleTap(rec: UITapGestureRecognizer, tupleIndex: Int) {
        print("handingTap1");
        if rec.state == .ended {
            print("handingTap1");
            let tooltip = planetSceneBodyAndTooltipList[tupleIndex].2
            let planetScene = planetSceneBodyAndTooltipList[tupleIndex].0
            print(tooltip.isShowing)
            print(tooltip.isHidden)
            print(tooltip.isFocused)
            for tuple in planetSceneBodyAndTooltipList {
                print("handingTap3");
                if tuple.2.isShowing {
                    print("handingTap4");
                    tooltip.cancelDismissTimer()
                    tuple.2.dismiss()
                }
            }
            print(tooltip.isShowing)
            print(tooltip.isHidden)
            print(tooltip.isFocused)
            if !tooltip.isShowing {
                print("handingTap5");
                tooltip.cancelDismissTimer()
                tooltip.present(from: planetScene, animated: true)//(from: CGPoint(x: self.compass.convert(planetScene.frame, to: self.view).midX, y: self.compass.convert(planetScene.frame, to: self.view).midY - 25), in: self.view, animated: false)
            }
            print(tooltip.isShowing)
            print(tooltip.isHidden)
            print(tooltip.isFocused)
            print("-------")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for tuple in planetSceneBodyAndTooltipList {
            tuple.2.cancelDismissTimer()
            tuple.2.dismiss()
        }
        super.touchesEnded(touches, with: event)
    }
}
