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
    
    var hasBeenShown = false
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet var name: UILabel!
    @IBOutlet var classification: UILabel!
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var sets: UILabel!
    @IBOutlet weak var rises: UILabel!
    @IBOutlet weak var RSTTimes: UIStackView!
    
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
    
    func setRSTTimes(rise: Date?, set: Date?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        
        let dateFormatterWithDay = DateFormatter()
        dateFormatterWithDay.dateFormat = "h:mm a \n MMM d"
        
        if let riseTime = rise, let setTime = set {
            
            if ((riseTime.day != Date.init().day && riseTime.day != Date.init().day.advanced(by: 1))
                || (setTime.day != Date.init().day && setTime.day != Date.init().day.advanced(by: 1))) {
                rises.text = dateFormatterWithDay.string(from: riseTime)
                sets.text = dateFormatterWithDay.string(from: setTime)
                
                rises.numberOfLines = 2
                sets.numberOfLines = 2
            } else {
                rises.text = dateFormatter.string(from: riseTime)
                sets.text = dateFormatter.string(from: setTime)
            }
            
            setView(view: RSTTimes, hidden: false)
        }
    }
    
    func clearRSTTimes() {
        self.rises.text = ""
        sets.text = ""
        setView(view: RSTTimes, hidden: true)
    }
    
    func setView(view: UIView, hidden: Bool) {
        view.isHidden = hidden
        if hasBeenShown {
            view.alpha = hidden ? 0 : 1
        } else {
            UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve,
                animations: {
                    // Animations
                    view.alpha = hidden ? 0 : 1
                },
                    completion: { finished in
                    self.hasBeenShown = true
                })
        }
    }
}
