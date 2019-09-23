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
import SwiftAA

class PlanetListViewController: UITableViewController, UISplitViewControllerDelegate {
    
    @IBAction func dismissInfo(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    let objects = Objects.solarSystem()
    var selectedGroup : Int?
    var selectedIndex : Int?
    var selectedMoon : Int?
    var collapseSplitView = true
    var sextant: Sextant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        splitViewController?.delegate = self
        
        let background = UIImageView(image: UIImage(named: "milkyway.jpg")!)
        background.contentMode = .scaleAspectFill

        tableView.backgroundView = setupParallaxEffect(parentView: background)

        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        

        blurView.frame = self.view.frame
        blurView.bounds = self.view.bounds

        var bounds = blurView.bounds
        bounds.size.height += 200
        bounds.size.width += 200
        blurView.bounds = bounds
        
        var frame = blurView.frame
        frame.size.height += 200
        frame.size.width += 200
        blurView.frame = frame
        
        background.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tableView.backgroundView!.addSubview(blurView)

        tableView.backgroundView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorEffect = UIVibrancyEffect(blurEffect: UIBlurEffect(style: .dark))
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension

        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            splitViewController?.preferredDisplayMode = .allVisible
        }
        
        sextant = (tabBarController as! TabBarViewController).locationManager
        //sextant.setCallbackFunction(locationUpdatedCallback)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateNav()
        //sextant.setCallbackFunction(locationUpdatedCallback)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setNavColors()
        
        let thisVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let thisVersionInt = Int(thisVersion.replacingOccurrences(of: ".", with: ""))
        
        let lastLaunchedVersion = UserDefaults.standard.integer(forKey: "lastLaunchedVersion")
        
        //if we have been launched before and the current version has not been launched before
        if (lastLaunchedVersion != 0 && lastLaunchedVersion < thisVersionInt!) {
            let alert = UIAlertController(title: "What's New", message: Change.last, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            setupSearchableContent()
        }
        
        UserDefaults.standard.set(true, forKey: "launchedBefore")
        UserDefaults.standard.set(thisVersionInt, forKey: "lastLaunchedVersion")
        
        let initialIndexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: initialIndexPath, animated: true, scrollPosition:UITableView.ScrollPosition.none)
    }
    
    override func didReceiveMemoryWarning() {
        print("Memory Warning")
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Objects.itemsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let classification = Class.allValues[indexPath.section]
        let planet = objects[classification]![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell") as! BodyCell
        cell.backgroundColor = UIColor.clear
        cell.name?.text = planet.name
        cell.classification?.text = planet.type.rawValue
        if (cell.sceneView != nil) {
            cell.sceneView.scene = planet.getScene(size: Size.small)
            cell.sceneView.isPlaying = true
            cell.sceneView.antialiasingMode = .multisampling4X
            cell.sceneView.preferredFramesPerSecond = 30
        }
        if (cell.sceneView.scene == nil) {
            cell.heightConstraint.constant = 90
        }
        if let location = sextant.location, let aaPlanet = planet.aa {
            let coords = GeographicCoordinates.init(location)
            let rstTimes = aaPlanet.riseTransitSetTimes(for: coords)

            cell.setRSTTimes(rise: rstTimes.riseTime?.date, set: rstTimes.setTime?.date)

        } else {
            cell.clearRSTTimes()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Class.allValues[section].rawValue
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //Class.count is broken here as of iOS 12 - returns 767147929446652799.  Hardcode workaround.
        return 3
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        BTBalloon.sharedInstance().hide()
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        
        header.textLabel!.textColor = UIColor.white
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
//        if activity.activityType == CSSearchableItemActionType {
//            if let userInfo = activity.userInfo {
//                let selectedItem = userInfo[CSSearchableItemActivityIdentifier] as! String
//                print(selectedItem)
//                let selectedGroup = selectedItem.components(separatedBy: ".")[1].components(separatedBy: "-")[1]
//                let selectedIndex = Int(selectedItem.components(separatedBy: ".")[2].components(separatedBy: "-")[1])
//                let didSelectMoon = selectedItem.components(separatedBy: ".").last!.contains("moon")
//
//                var classFromName = Class.Major
//
//                switch selectedGroup {
//                case "Dwarf Planets":
//                    classFromName = Class.Dwarf
//                case "Other":
//                    classFromName = Class.Other
//                default:
//                    break
//                }
//
//                if didSelectMoon {
//                    selectedMoon = Int(selectedItem.components(separatedBy: ".")[3].components(separatedBy: "-")[1])
//                    let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoonDetail") as! DetailViewController
//                    newVC.body = objects[classFromName]?[selectedIndex!].moons[selectedMoon!]
//                    //self.navigationController?.pushViewController(newVC, animated: true)
//                } else {
//                    //let navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlanetDetail") as! UINavigationController
//                    let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
//                    newVC.body = objects[classFromName]?[selectedIndex!]
//                    print("set VS planet = to " + (objects[classFromName]?[selectedIndex!].name)!)
//
//                    if splitViewController?.secondaryViewController != nil {
//                        if (newVC.body.name != ((splitViewController?.secondaryViewController as! UINavigationController).topViewController as! DetailViewController).body.name) {
//                            pushDetailViewToProperParent(viewController: newVC)
//                        }
//                    } else { //we are on an iPhone :(
//                        if (newVC.body.name != ((splitViewController?.primaryViewController as? UINavigationController)?.topViewController as? DetailViewController)?.body.name) {
//                            pushDetailViewToProperParent(viewController: newVC)
//                        } else if ((splitViewController?.primaryViewController as? UINavigationController)?.topViewController as? PlanetListViewController) != nil {
//                            pushDetailViewToProperParent(viewController: newVC)
//                        }
//                    }
//
//                }
//            }
//        }
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
    
    func locationUpdatedCallback() {
        self.tableView.reloadData()
        print("made callback")
    }
    
    func animateNav() {
        guard let coordinator = self.transitionCoordinator else {
            return
        }
        
        coordinator.animate(alongsideTransition: {
            [weak self] context in self?.setNavColors()
        }, completion: nil)
    }
    
    func setNavColors() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        tabBarController?.tabBar.barTintColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
    }
}
