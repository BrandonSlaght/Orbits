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
