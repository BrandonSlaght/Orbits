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
        bar.navigationBar.sendSubview(toBack: blurView)
    }
}

func addBlurEffect(toNav bar:UINavigationController) {
    // Add blur view
    //guard let view = bar else { return }
    
    if (bar.navigationBar.viewWithTag(10) != nil) {
        print("View already has blur")
        return
    }
    
    //This will let visualEffectView to work perfectly
    //if let navBar = bar.navigationBar as? UINavigationBar{
        bar.navigationBar.setBackgroundImage(UIImage(), for: .default)
        bar.navigationBar.shadowImage = UIImage()
    //}
    
    var bounds = bar.navigationBar.bounds
    bounds = bounds.offsetBy(dx: 0.0, dy: -20.0)
    bounds.size.height = bounds.height + 20.0
    
    let blurEffect = UIBlurEffect(style: .regular)
    let visualEffectView = UIVisualEffectView(effect: blurEffect)
    
    visualEffectView.isUserInteractionEnabled = false
    visualEffectView.frame = bounds
    visualEffectView.tag = 11
    visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    bar.navigationBar.insertSubview(visualEffectView, at: 0)
    
    bar.navigationBar.sendSubview(toBack: visualEffectView)
}
