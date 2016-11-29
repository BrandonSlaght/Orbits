//
//  AboutTableViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/5/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {
    
    var planet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let path = UIBezierPath(roundedRect:tableView.bounds, byRoundingCorners:[.BottomRight, .BottomLeft], cornerRadii: CGSizeMake(3, 3))
//        let borderLayer = CAShapeLayer()
//        borderLayer.frame = tableView.bounds
//        borderLayer.path = path.CGPath
//        borderLayer.lineWidth = 1.0
//        borderLayer.strokeColor = UIColor.whiteColor().CGColor
//        borderLayer.fillColor = UIColor.clearColor().CGColor
//        
//        tableView.translatesAutoresizingMaskIntoConstraints = true
//        
//        tableView.layer.addSublayer(borderLayer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}