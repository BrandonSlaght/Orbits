//
//  PlanetListViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/30/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class PlanetListViewController: UITableViewController {
    
    @IBAction func dismissInfo(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    let objects = Objects.planets()
    
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
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 75
        tableView.rowHeight = 200
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UserDefaults.standard.set(true, forKey: "launchedBefore")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Objects.itemsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetCell
        cell.backgroundColor = UIColor.clear
        let classification = Class.allValues[indexPath.section]
        let planet = objects[classification]![indexPath.row]
        cell.name?.text = planet.name
        cell.classification?.text = planet.type.rawValue
        cell.sceneView.scene = planet.getScene(size: Size.small)
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
        header.contentView.backgroundColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1.0)
        header.textLabel!.textColor = UIColor.white
//        header.backgroundView?.alpha = 0.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "planetSegue") {
            let detail = segue.destination as! PlanetDetailViewController
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                let classification = Class.allValues[indexPath.section]
                detail.planet = objects[classification]![indexPath.row]
            }
        }
    }
}
