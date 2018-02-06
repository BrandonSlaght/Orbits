//
//  PlanetCell.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/30/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit
import SceneKit

class BodyCell: UITableViewCell {
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet var name: UILabel!
    @IBOutlet var classification: UILabel!
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var sets: UILabel!
    @IBOutlet weak var rises: UILabel!
    
//    func updateLabels() {
//        let bodyFont = UIFont.preferredFontForTextStyle(style: UIFontTextStyle.body)
//        title.font = bodyFont
//        let caption1Font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
//        detail1.font = caption1Font
//        detail2.font = caption1Font
//    }
    
    override func prepareForReuse() {
        heightConstraint.constant = 183
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let superview = contentView.superview else {
            return
        }
        for subview in superview.subviews {
            if String(describing: type(of: subview)).hasSuffix("SeparatorView") {
                //subview.isHidden = false
            }
        }
    }
}
