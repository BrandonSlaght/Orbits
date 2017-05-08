//
//  PlanetListViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/30/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices
import SceneKit
import CLibnova

protocol PlanetSelectionDelegate: class {
    func planetSelected(newPlanet: Planet)
}

class PlanetListViewController: UITableViewController {
    
    @IBAction func dismissInfo(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    weak var delegate: PlanetSelectionDelegate?
    let objects = Objects.planets()
    var selectedGroup : Int?
    var selectedIndex : Int?
    var selectedMoon : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = UIImageView(image: UIImage(named: "milkyway.jpg")!)
        background.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        background.addSubview(blurView)
        tableView.backgroundView = background
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorEffect = UIVibrancyEffect(blurEffect: blurView.effect as! UIBlurEffect)
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
        setupSearchableContent()

        //let test = Libnova.uranus_new()
        
        //let test = uranus.ln_get_uranus_sdiam(5.0)
        
        //objects.first?.value[0].getVisibility()
        
//        let bounds = self.navigationController?.navigationBar.bounds as CGRect!
//        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
//        visualEffectView.frame = bounds!
//        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.navigationController?.navigationBar.alpha = 0.5
//        self.navigationController?.navigationBar.addSubview(visualEffectView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let thisVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let thisVersionInt = Int(thisVersion.replacingOccurrences(of: ".", with: ""))
        print(thisVersionInt)
        
        let lastLaunchedVersion = UserDefaults.standard.integer(forKey: "lastLaunchedVersion")
        print(lastLaunchedVersion)
        
        //if we have been launched before and the current version has not been launched before
        if (lastLaunchedVersion != 0 && lastLaunchedVersion < thisVersionInt!) {
            let alert = UIAlertController(title: "What's New",
                                          message: Change.last,
                                          preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
            self.present(alert,
                         animated: true,
                         completion: nil)
        }
        
        UserDefaults.standard.set(true, forKey: "launchedBefore")
        UserDefaults.standard.set(thisVersionInt, forKey: "lastLaunchedVersion")
        
        let initialIndexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: initialIndexPath, animated: true, scrollPosition:UITableViewScrollPosition.none)
        
        print("got here")
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            print("detected iPad")
            //self.performSegue(withIdentifier: "planetSegue", sender: initialIndexPath)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Objects.itemsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let classification = Class.allValues[indexPath.section]
        let planet = objects[classification]![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetCell
        cell.backgroundColor = UIColor.clear
        cell.name?.text = planet.name
        cell.classification?.text = planet.type.rawValue
        if (cell.sceneView != nil) {
            cell.sceneView.scene = planet.getScene(size: Size.small)
            cell.sceneView.isPlaying = true
            cell.sceneView.antialiasingMode = .multisampling4X
            cell.sceneView.preferredFramesPerSecond = 15
        }
        if (planet.getScene(size: Size.small) == nil) {
            print(planet.name + "is nil modeled")
            cell.heightConstraint.constant = 90
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Class.allValues[section].rawValue
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Class.count
    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let subviews = cell.subviews
//        let classification = Class.allValues[indexPath.section]
//        if indexPath.row == (objects[classification]?.count)! - 1 && subviews.count >= 3 {
//            for subview in subviews {
//                if subview != cell.contentView {
//                    print("removing last table separator in section")
//                    //subview.removeFromSuperview()
//                }
//            }
//        }
//    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        header.textLabel!.textColor = UIColor.white
        
//        let blurEffect = UIBlurEffect(style: .dark)
//        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
//        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
//        vibrancyEffectView.frame = view.frame
//        vibrancyEffectView.autoresizingMask = .flexibleWidth
//        
//        view.addSubview(vibrancyEffectView)
    }
    
    func setupSearchableContent() {
        var searchableItems = [CSSearchableItem]()
        
        for group in objects {
            var i = 0
            for planet in group.value {
                let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
                searchableItemAttributeSet.title = planet.name
                searchableItemAttributeSet.displayName = planet.name
                searchableItemAttributeSet.kind = planet.classification.rawValue
//                let imagePathParts = movie["Image"]!.componentsSeparatedByString(".")
//                searchableItemAttributeSet.thumbnailURL = NSBundle.mainBundle().URLForResource(imagePathParts[0], withExtension: imagePathParts[1])
            
                if let let_description = planet.description {
                    searchableItemAttributeSet.contentDescription = let_description
                }
                var keywords = [String]()
                keywords.append(planet.name)
                keywords.append(planet.classification.rawValue)
                keywords.append(planet.type.rawValue)
                searchableItemAttributeSet.keywords = keywords
                
                let searchableItem = CSSearchableItem(uniqueIdentifier: "orbitals.group-\(group.key.rawValue).planet-\(i)", domainIdentifier: "planet", attributeSet: searchableItemAttributeSet)
                
                searchableItems.append(searchableItem)
                
                var j = 0
                for moons in planet.moons {
                    let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
                    searchableItemAttributeSet.title = moons.name
                    searchableItemAttributeSet.displayName = moons.name
                    searchableItemAttributeSet.kind = "Moon"
                    //                let imagePathParts = movie["Image"]!.componentsSeparatedByString(".")
                    //                searchableItemAttributeSet.thumbnailURL = NSBundle.mainBundle().URLForResource(imagePathParts[0], withExtension: imagePathParts[1])
                
                    if let let_description = moons.description {
                        searchableItemAttributeSet.contentDescription = let_description
                    }
                    var keywords = [String]()
                    keywords.append(moons.name)
                    keywords.append("moon")
                    keywords.append(planet.name)
                    searchableItemAttributeSet.keywords = keywords
                
                    let searchableItem = CSSearchableItem(uniqueIdentifier: "orbitals.group-\(group.key.rawValue).planet-\(i).moon-\(j)", domainIdentifier: "moon", attributeSet: searchableItemAttributeSet)
                
                    searchableItems.append(searchableItem)
                    j += 1
                }
                i += 1
            }
        }
        
        CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) -> Void in
            if error != nil {
                print(error?.localizedDescription ?? "error indexing")
            }
        }
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if activity.activityType == CSSearchableItemActionType {
            if let userInfo = activity.userInfo {
                let selectedItem = userInfo[CSSearchableItemActivityIdentifier] as! String
                print(selectedItem)
                let selectedGroup = selectedItem.components(separatedBy: ".")[1].components(separatedBy: "-")[1]
                let selectedIndex = Int(selectedItem.components(separatedBy: ".")[2].components(separatedBy: "-")[1])
                let didSelectMoon = selectedItem.components(separatedBy: ".").last!.contains("moon")
                
                var classFromName = Class.Major
                
                switch selectedGroup {
                case "Dwarf Planets":
                    classFromName = Class.Dwarf
                case "Other":
                    classFromName = Class.Other
                default:
                    break
                }
                
                if didSelectMoon {
                    selectedMoon = Int(selectedItem.components(separatedBy: ".")[3].components(separatedBy: "-")[1])
                    let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoonDetail") as! MoonDetailViewController
                    newVC.moon = objects[classFromName]?[selectedIndex!].moons[selectedMoon!]
                    self.navigationController?.pushViewController(newVC, animated: true)
                } else {
                    let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlanetDetail") as! PlanetDetailViewController
//                    let navVC = UINavigationController(rootViewController: newVC)
//                    navVC.toolbar.tintColor = UIColor.white
//                    navVC.toolbar.left
                    newVC.planet = objects[classFromName]?[selectedIndex!]
                    print("set VS planet = to " + (objects[classFromName]?[selectedIndex!].name)!)
                    //self.navigationItem.present(navVC, animated: true)
                    self.navigationController?.pushViewController(newVC, animated: true)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let classification = Class.allValues[indexPath.section]
        self.delegate?.planetSelected(newPlanet: objects[classification]![indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "planetSegue") {//|| segue.identifier == "showDetails") {
//            let detail = segue.destination as! PlanetDetailViewController
//            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
//                let classification = Class.allValues[indexPath.section]
//                detail.planet = objects[classification]![indexPath.row]
//                self.delegate?.planetSelected(newPlanet: objects[classification]![indexPath.row])
//            } else {
//                if let let_group = selectedGroup, let let_index = selectedIndex {
//                    if let let_moon = selectedMoon {
//                        let moonDetail = segue.destination as! MoonDetailViewController
//                        let classification = Class.allValues[let_group]
//                        moonDetail.moon = objects[classification]![let_index].moons[let_moon]
//                    } else {
//                        let classification = Class.allValues[let_group]
//                        detail.planet = objects[classification]![let_index]
//                    }
//                }
//            } else if let cell = sender as? IndexPath{
//                print("detected segue")
//                let tableCell = self.tableView.cellForRow(at: cell)
//                let indexPath = self.tableView.indexPath(for: tableCell!)
//                
//                let classification = Class.allValues[(indexPath?.section)!]
//                detail.planet = objects[classification]![(indexPath?.row)!]
//            }
//        }
    }
}
