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

class PlanetListViewController: UITableViewController, UISplitViewControllerDelegate {
    
    @IBAction func dismissInfo(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    let objects = Objects.planets()
    var selectedGroup : Int?
    var selectedIndex : Int?
    var selectedMoon : Int?
    var collapseSplitView = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        splitViewController?.delegate = self
        
        let background = UIImageView(image: UIImage(named: "milkyway.jpg")!)
        background.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        background.addSubview(blurView)
        tableView.backgroundView = background

        tableView.backgroundView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorEffect = UIVibrancyEffect(blurEffect: UIBlurEffect(style: .dark))
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension

        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
        setupSearchableContent()
        
        print("here in planet list view did load")
        
        //addBlurEffect(toNav: self.navigationController!)
        
        //navigationController?.navigationItem.
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        //self.navigationController?.navigationBar.barTintColor = UIColor.clear
//        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
//        let newBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.regular)
//        let blurEffectView = UIVisualEffectView(effect: newBlurEffect)
//        //always fill the view
//        var bounds = (self.navigationController?.navigationBar.bounds)!
//        bounds = bounds.offsetBy(dx: 0.0, dy: -20.0)
//        bounds.size.height = bounds.height + 20.0
//        blurEffectView.frame = bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        blurEffectView.tag = 10
//        blurEffectView.isUserInteractionEnabled = false
//        
//        self.navigationController?.navigationBar.insertSubview(blurEffectView, at: 0)
        //self.navigationController?.navigationBar.sendSubview(toBack: blurEffectView)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            splitViewController?.preferredDisplayMode = .allVisible
        }
        
        //parallax
//        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
//        verticalMotionEffect.minimumRelativeValue = -50
//        verticalMotionEffect.maximumRelativeValue = 50
//        
//        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
//        horizontalMotionEffect.minimumRelativeValue = -50
//        horizontalMotionEffect.maximumRelativeValue = 50
//        
//        let group = UIMotionEffectGroup()
//        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
//        tableView.backgroundView?.addMotionEffect(group)
        
//        var JD: Double
//        var observer: ln_lnlat_posn = ln_lnlat_posn()
//        var rst: ln_rst_time = ln_rst_time()
//        var rise: ln_zonedate = ln_zonedate()
//        var set: ln_zonedate = ln_zonedate()
//        var transit: ln_zonedate = ln_zonedate()
//        
//        observer.lat = 55.92 /* 55.92 N */
//        observer.lng = -3.18 /* 3.18 W */
//        JD = ln_get_julian_from_sys();
//        if (ln_get_mars_rst(JD, &observer, &rst) != 0) {
//            print("Mars is circumpolar")
//        } else {
//            ln_get_local_date(rst.rise, &rise);
//            ln_get_local_date(rst.transit, &transit);
//            ln_get_local_date(rst.set, &set);
//            print(rise.days);
//            print(rise.hours);
//            print(rise.minutes);
//            print(rise.seconds);
//            //print("Transit " + &transit);
//            //print("Set " + &set);
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        //moveTagToBack(ofNav: self.navigationController!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewDidAppear")
        
        
        
        //moveTagToBack(ofNav: self.navigationController!)

        //let effectView = self.navigationController?.navigationBar.viewWithTag(10)
        //self.navigationController?.navigationBar.sendSubview(toBack: effectView!)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        
        let thisVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let thisVersionInt = Int(thisVersion.replacingOccurrences(of: ".", with: ""))
        
        let lastLaunchedVersion = UserDefaults.standard.integer(forKey: "lastLaunchedVersion")
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! BodyCell
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
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let subviews = cell.subviews
        let classification = Class.allValues[indexPath.section]
        if indexPath.row == (objects[classification]?.count)! - 1 && subviews.count >= 3 {
            for subview in subviews {
                if subview != cell.contentView {
                    //print("removing last table separator in section")
                    //subview.removeFromSuperview()
                }
            }
        }
    }
//    
//    func changeDetailNavColor(to color: UIColor) {
//        print("in changing color method")
//        if let let_detail = self.splitViewController?.secondaryViewController {
//            let_detail.navigationController?.navigationBar.barTintColor = color
//        } else {
//            self.navigationController?.navigationBar.barTintColor = color
//        }
//    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        BTBalloon.sharedInstance().hide()
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        
//        if (header.subviews.count < 3) {
            header.textLabel!.textColor = UIColor.white
//            
//            header.contentView.backgroundColor = UIColor.clear
//            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.regular)
//            let blurEffectView = UIVisualEffectView(effect: blurEffect)
//            //always fill the view
//            blurEffectView.frame = header.contentView.bounds
//            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//            
//            header.addSubview(blurEffectView)
//            header.sendSubview(toBack: blurEffectView)
//            header.backgroundView?.backgroundColor = UIColor.clear
//        }
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
                    let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoonDetail") as! DetailViewController
                    newVC.body = objects[classFromName]?[selectedIndex!].moons[selectedMoon!]
                    //self.navigationController?.pushViewController(newVC, animated: true)
                } else {
                    //let navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlanetDetail") as! UINavigationController
                    let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
                    newVC.body = objects[classFromName]?[selectedIndex!]
                    print("set VS planet = to " + (objects[classFromName]?[selectedIndex!].name)!)
                    
                    if splitViewController?.secondaryViewController != nil {
                        if (newVC.body.name != ((splitViewController?.secondaryViewController as! UINavigationController).topViewController as! DetailViewController).body.name) {
                            pushDetailViewToProperParent(viewController: newVC)
                        }
                    } else { //we are on an iPhone :(
                        if (newVC.body.name != ((splitViewController?.primaryViewController as? UINavigationController)?.topViewController as? DetailViewController)?.body.name) {
                            pushDetailViewToProperParent(viewController: newVC)
                        } else if ((splitViewController?.primaryViewController as? UINavigationController)?.topViewController as? PlanetListViewController) != nil {
                            pushDetailViewToProperParent(viewController: newVC)
                        }
                    }

                }
            }
        }
    }
    
    func pushDetailViewToProperParent(viewController: UIViewController) {
        if splitViewController?.secondaryViewController != nil {
            (self.splitViewController?.secondaryViewController as! UINavigationController).pushViewController(viewController, animated: true)
        } else { //we are on an iPhone :(
            (self.splitViewController?.primaryViewController as! UINavigationController).pushViewController(viewController, animated: true)
        }
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return collapseSplitView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        collapseSplitView = false
        
        if segue.identifier == "planetSegue", let destination = segue.destination as? UINavigationController {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                let classification = Class.allValues[indexPath.section]
                let detail = destination.topViewController as? DetailViewController
                detail?.body = objects[classification]![indexPath.row]
            }
        }
        
//        if (segue.identifier == "planetSegue") {//|| segue.identifier == "showDetails") {
//            let detail = segue.destination as! UINavigationController
//            let view = detail.topViewController as! DetailViewController
//            
//        }
//        
//        if let let_nav = self.navigationController {
//            let_nav.navigationBar.backgroundColor = getRandomColor()
//        }
//        if (segue.identifier == "planetSegue") {//|| segue.identifier == "showDetails") {
//            let detail = segue.destination as! PlanetDetailViewController
//            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
//                let classification = Class.allValues[indexPath.section]
//                detail.planet = objects[classification]![indexPath.row]
////            } else {
////                if let let_group = selectedGroup, let let_index = selectedIndex {
////                    if let let_moon = selectedMoon {
////                        let moonDetail = segue.destination as! MoonDetailViewController
////                        let classification = Class.allValues[let_group]
////                        moonDetail.moon = objects[classification]![let_index].moons[let_moon]
////                    } else {
////                        let classification = Class.allValues[let_group]
////                        detail.planet = objects[classification]![let_index]
////                    }
////                }
////            } else if let cell = sender as? IndexPath{
////                print("detected segue")
////                let tableCell = self.tableView.cellForRow(at: cell)
////                let indexPath = self.tableView.indexPath(for: tableCell!)
////                
////                let classification = Class.allValues[(indexPath?.section)!]
////                detail.planet = objects[classification]![(indexPath?.row)!]
//            }
//        }
    }
}
