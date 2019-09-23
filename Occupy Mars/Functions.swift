//
//  Functions.swift
//  Occupy Mars
//
//  Created by Admin on 5/14/17.
//  Copyright © 2017 Slaght, Brandon. All rights reserved.
//

import Foundation
import UIKit

func getBlurView(frame: CGRect) -> UIView {
    let blurEffect = UIBlurEffect(style: .dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = frame
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    blurEffectView.layer.zPosition = -1
    blurEffectView.isUserInteractionEnabled = false
    return blurEffectView
}

func getBlurViewWithBackground(frame: CGRect, background: String) -> UIView {
    let background = UIImageView(image: UIImage(named: background)!)
    background.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    background.contentMode = .scaleAspectFill
    background.addSubview(getBlurView(frame: frame))
    return background
}

func moveTagToBack(ofNav bar:UINavigationController) {
    if let blurView = bar.navigationBar.viewWithTag(11) {
        bar.navigationBar.sendSubviewToBack(blurView)
    }
}

func setupParallaxEffect(parentView: UIView) -> UIView {
    //let wrapperview = UIView()
    
    var bounds = parentView.bounds
    bounds.origin.x -= 50
    bounds.origin.y -= 50
    bounds.size.height += 100
    bounds.size.width += 100
    parentView.bounds = bounds
    
    var frame = parentView.frame
    frame.origin.x -= 50
    frame.origin.y -= 50
    frame.size.height += 100
    frame.size.width += 100
    parentView.frame = frame
    
    //parentView.clipsToBounds = false
    //wrapperview.clipsToBounds = false
    
    //parentView.frame = frame
    //wrapperview.layer.insertSublayer(playerLayer!, at: 0)
    parentView.addMotionEffect(getMotionEffectGroup())
    //self.view.addSubview(wrapperview)
    //self.view.sendSubviewToBack(wrapperview)
    
    return parentView
}

func getMotionEffectGroup() -> UIMotionEffectGroup {
    let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
    verticalMotionEffect.minimumRelativeValue = -50
    verticalMotionEffect.maximumRelativeValue = 50
    
    let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
    horizontalMotionEffect.minimumRelativeValue = -50
    horizontalMotionEffect.maximumRelativeValue = 50
    
    let group = UIMotionEffectGroup()
    group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
    return group
}
