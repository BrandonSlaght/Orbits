//
//  DetailsAboutViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/5/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class DetailsAboutViewController: AboutViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var geologyTable: UITableView!
    @IBOutlet weak var orbitTable: UITableView!
    @IBOutlet weak var miscTable: UITableView!
    @IBOutlet weak var geologyHeight: NSLayoutConstraint!
    @IBOutlet weak var orbitHeight: NSLayoutConstraint!
    @IBOutlet weak var miscHeight: NSLayoutConstraint!
    
    var geology = [(String, String, String)]()
    var orbit = [(String, String, String)]()
    var misc = [(String, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        geology = body.generateGeologyObjects()
        orbit = body.generateOrbitalObjects()
        misc = body.generateMiscObjects()

        geologyTable.delegate = self
        geologyTable.dataSource = self
        geologyTable.register(UINib(nibName: "DataViewCell", bundle: nil), forCellReuseIdentifier: "geologyCell")
        
        orbitTable.delegate = self
        orbitTable.dataSource = self
        orbitTable.register(UINib(nibName: "DataViewCell", bundle: nil), forCellReuseIdentifier: "orbitCell")
        
        miscTable.delegate = self
        miscTable.dataSource = self
        miscTable.register(UINib(nibName: "DataViewCell", bundle: nil), forCellReuseIdentifier: "miscCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        geologyTable.layoutIfNeeded()
        geologyHeight.constant = geologyTable.contentSize.height
        
        orbitTable.layoutIfNeeded()
        orbitHeight.constant = orbitTable.contentSize.height
        
        miscTable.layoutIfNeeded()
        miscHeight.constant = miscTable.contentSize.height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView == self.geologyTable {
            count = geology.count
        } else if tableView == self.orbitTable {
            count = orbit.count
        } else if tableView == self.miscTable {
            count = misc.count
        }
        return count!
    }
    
    func superscript(string: String, fontName: String, size: Int) -> NSAttributedString {
        let font:UIFont? = UIFont(name: fontName, size: CGFloat(size))
        let fontSuper:UIFont? = UIFont(name: fontName, size: CGFloat(size/2) + 2)
        let copy = string.replacingOccurrences(of: "^", with: "")
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: copy, attributes: [NSAttributedStringKey.font:font!])
        
        if let let_index = string.characters.index(of: Character("^")) {
            let pos = copy.characters.distance(from: copy.startIndex, to: let_index)
            let length = copy.characters.distance(from: let_index, to: copy.endIndex)
            attString.setAttributes([NSAttributedStringKey.font:fontSuper!,NSAttributedStringKey.baselineOffset:10], range: NSRange(location: pos, length: length))
            return attString;
        } else {
            return NSAttributedString(string: string)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell: DataViewCellViewController
        
        let singleTap = UITapGestureRecognizer()
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        singleTap.cancelsTouchesInView = false;

        if tableView == self.geologyTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "geologyCell", for: indexPath as IndexPath) as! DataViewCellViewController
            let previewDetail = geology[indexPath.row]
            cell.field!.text = previewDetail.0
            let value = NSMutableAttributedString()
            value.append(superscript(string: previewDetail.1, fontName: cell.value.font.fontName, size: Int(cell.value.font.pointSize)))
            value.append(NSAttributedString(string: previewDetail.2))
            cell.value!.attributedText = value
            addTargets(key: previewDetail.0, gesture: singleTap, view: cell.info!)
        } else if tableView == self.orbitTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "orbitCell", for: indexPath as IndexPath) as! DataViewCellViewController
            let previewDetail = orbit[indexPath.row]
            cell.field!.text = previewDetail.0
            let value = NSMutableAttributedString()
            value.append(superscript(string: previewDetail.1, fontName: cell.value.font.fontName, size: Int(cell.value.font.pointSize)))
            value.append(NSAttributedString(string: previewDetail.2))
            cell.value!.attributedText = value
            addTargets(key: previewDetail.0, gesture: singleTap, view: cell.info!)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "miscCell", for: indexPath as IndexPath) as! DataViewCellViewController
            let previewDetail = misc[indexPath.row]
            cell.field!.text = previewDetail.0
            cell.value!.text = previewDetail.1
            addTargets(key: previewDetail.0, gesture: singleTap, view: cell.info!)
        }
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = UIColor.clear
        } else {
            cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func addTargets(key: String, gesture: UITapGestureRecognizer, view: UILabel) {
        BTBalloon.sharedInstance().hide()
        gesture.cancelsTouchesInView = false
        switch key {
        case "Mass":
            //view.tag = 1
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addMass(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Volume":
            //view.tag = 2
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addVolume(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Density":
            //view.tag = 3
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Radius":
            //view.tag = 4
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Gravity":
            view.tag = 5
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addGravity(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Escape Velocity":
            view.tag = 6
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addEscapeVelocity(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Irradiance":
            view.tag = 7
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addIrradiance(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Height Variance":
            view.tag = 8
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addHeightVariance(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Year Length":
            //view.tag = 9
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Orbital Length":
            //view.tag = 10
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Day Length":
            //view.tag = 11
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Average Velocity":
            view.tag = 12
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addAverageVelocity(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Perigee":
            view.tag = 13
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addPerigee(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Perihilion":
            view.tag = 14
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addPerihilion(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Apogee":
            view.tag = 15
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addApogee(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Aphelion":
            view.tag = 16
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addAphelion(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Orbital Tilt":
            view.tag = 17
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addOrbitalTilt(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Eccentricity":
            view.tag = 18
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addEccentricity(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Equatorial Tilt":
            view.tag = 19
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addEquatorialTilt(_:)))
            view.addGestureRecognizer(gesture)
            view.text = " ⓘ"
        case "Nearest to Earth":
            //view.tag = 20
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Farthest from Earth":
            //view.tag = 21
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Moons":
            //view.tag = 22
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Ring System":
            //view.tag = 23
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Type":
            //view.tag = 24
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addType(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Position from Sun":
            //view.tag = 25
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Position from Planet":
            //view.tag = 26
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        case "Date of Discovery":
            //view.tag = 27
            //gesture.addTarget(self, action: #selector(DetailsAboutViewController.addDensity(_:)))
            //view.addGestureRecognizer(gesture)
            break
        default:
            print("THERE IS AN UNHANDLED DETAILS CASE: \(key)")
            break
        }
    }
    
    @objc func addGravity(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "The speed you would accelerate in free fall on the surface of the planet.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(5)!)
    }
    
    @objc func addEscapeVelocity(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "The minimum speed you need to be traveling to completely escape the planet's gravitational influence.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(6)!)
    }
    
    @objc func addIrradiance(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "How much energy the planet recieves from the Sun, in watts.  A perfect solar panel would be able to produce this much energy per square meter of coverage.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(7)!)
    }
    
    @objc func addHeightVariance(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "The difference between the highest and lowest points on the planet.  On Earth, this would be Mt. Everest and the Mariana Trench",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(8)!)
    }
    
    @objc func addAverageVelocity(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "The average speed that the planet moves around the Sun.  The velocity isn't constant because planets move faster when they are closer to the Sun.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(12)!)
    }
    
    @objc func addPerigee(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "The closest a moon gets to the planet it orbits.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(13)!)
    }
    
    @objc func addPerihilion(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "The closest the planets comes to the Sun in its orbit.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(14)!)
    }
    
    @objc func addApogee(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "The farthest a moon gets from the planet it orbits.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(15)!)
    }
    
    @objc func addAphelion(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "The farthest a planet gets from the Sun in its orbit.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(16)!)
    }
    
    @objc func addOrbitalTilt(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "How many degrees off the orbital plane the planet orbits.  The orbital plane is set equal to Earth's orbit.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(17)!)
    }
    
    @objc func addEccentricity(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "The amount by which the planet's orbit deviates from a perfect circle.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(18)!)
    }
    
    @objc func addEquatorialTilt(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().show(withTitle: "How much the poles of the planet deviate from zero.  Significant deviations cause seasonal cycles on planets.",
                                        image: nil,
                                        anchorTo: self.view.viewWithTag(19)!)
    }
}
