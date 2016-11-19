//
//  MoonCell.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/5/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit
import SceneKit

class MoonCell: UITableViewCell {
    @IBOutlet var name: UILabel!
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