//
//  MoonsAboutViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/5/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class MoonAboutViewController: AboutTableViewController {
    
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
        print (cell.name.text!)
        cell.sceneView.scene = objects[indexPath.row].getScene(size: Size.small)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("here")
        if (segue.identifier == "moonSegue") {
            print("here2")
            let detail = segue.destination as! MoonDetailViewController
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                detail.moon = planet.moons[indexPath.row]
            }
        }
    }
}
