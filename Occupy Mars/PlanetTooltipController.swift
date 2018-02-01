//
//  PlanetTooltipController.swift
//  Occupy Mars
//
//  Created by Brandon Slaght on 1/4/18.
//  Copyright © 2018 Slaght, Brandon. All rights reserved.
//

import Foundation

class PlanetTooltipController: UIView {
    
    @IBOutlet weak var arrowView: UIImageView!
    @IBOutlet weak var wrapStackView: UIStackView!
    @IBOutlet weak var arrowViewWidth: NSLayoutConstraint!
    @IBOutlet weak var arrowViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //set height
        let availableTooltipHeight = self.wrapStackView.frame.size.height
        self.frame.size.height = availableTooltipHeight
        
        //calculate ideal width of arrow based on height
        arrowViewHeight.constant = availableTooltipHeight - 20
        arrowViewWidth.constant = arrowViewHeight.constant * (arrowView.image!.size.width / arrowView.image!.size.height)
        
        //arrowView.layoutIfNeeded()
        //arrowView.layoutSubviews()
        //set width now that we have the width
        let availableTooltipWidth = self.wrapStackView.frame.size.width
        self.frame.size.width = availableTooltipWidth;
        
        super.layoutSubviews()
    }
}
