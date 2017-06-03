//
//  FrostTabBarController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/24/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class FrostTabBarController: UITabBarController {
    override func viewDidLoad() {
        UITabBar.appearance().barTintColor = UIColor(colorLiteralRed: 0x61, green: 0x61, blue: 0x61, alpha: 0)
    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.backgroundImage = UIImage.imageWithColor(UIColor.clearColor())
//        let frost = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
//        frost.frame = self.bounds
//        frost.autoresizingMask = .FlexibleWidth
//        self.insertSubview(frost, atIndex: 0)
//    }
}