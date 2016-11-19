//
//  PlanetCell.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/30/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit
import SceneKit

class PlanetCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var classification: UILabel!
    @IBOutlet weak var sceneView: SCNView!
    
//    func updateLabels() {
//        let bodyFont = UIFont.preferredFontForTextStyle(style: UIFontTextStyle.body)
//        title.font = bodyFont
//        let caption1Font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
//        detail1.font = caption1Font
//        detail2.font = caption1Font
//    }
    
    override func layoutSubviews() {
        
    }
}