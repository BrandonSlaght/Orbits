//
//  MoonsAboutViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/5/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class MoonsAboutViewController: AboutTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorEffect = UIVibrancyEffect(blurEffect: blurView.effect as! UIBlurEffect)
        tableView.rowHeight = 200
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planet.moons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoonCell", for: indexPath) as! MoonCell
        cell.backgroundColor = UIColor.clear
        let objects = planet.moons
        print (objects[indexPath.row].name)
        cell.name?.text = objects[indexPath.row].name
        print (cell.name.text)
        cell.sceneView.scene = objects[indexPath.row].getScene(Size.small)
        return cell
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if (segue.identifier == "planetSegue") {
//            let detail = segue.destinationViewController as! DetailViewController
//            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(cell) {
//                detail.planet = Objects.planets()[indexPath.row]
//            }
//        }
//    }
}
