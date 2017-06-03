//
//  MoonsAboutViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/5/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class MoonAboutViewController: AboutViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorEffect = UIVibrancyEffect(blurEffect: blurView.effect as! UIBlurEffect)
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidLayoutSubviews() {
        tableView.layoutIfNeeded()
        tableViewHeight.constant = tableView.contentSize.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return body.moons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoonCell", for: indexPath) as! BodyCell
        cell.backgroundColor = UIColor.clear
        let objects = body.moons
        cell.name?.text = objects[indexPath.row].name
        
        if (cell.sceneView != nil) {
            cell.sceneView.scene = objects[indexPath.row].getScene(size: Size.small)
            cell.sceneView.isPlaying = true
            cell.sceneView.antialiasingMode = .multisampling4X
            cell.sceneView.preferredFramesPerSecond = 15
        }
        if (objects[indexPath.row].getScene(size: Size.small) == nil) {
            print(objects[indexPath.row].name + "is nil modeled")
            cell.heightConstraint.constant = 60
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let detail = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController
        detail?.body = body.moons[index]
        self.navigationController?.pushViewController(detail!, animated: true)
    }
}
