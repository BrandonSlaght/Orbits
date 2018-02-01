//
//  Extensions.swift
//  Occupy Mars
//
//  Created by Admin on 5/14/17.
//  Copyright © 2017 Slaght, Brandon. All rights reserved.
//

import Foundation

extension Int {
    var degreesToRadians: Double {
        return Double(self) * Double.pi / 180
    }
}

extension Double {
    var degreesToRadians: Double {
        return self * Double.pi / 180
    }
}

extension UISplitViewController {
    var primaryViewController: UIViewController? {
        return self.viewControllers.first
    }
    
    var secondaryViewController: UIViewController? {
        return self.viewControllers.count > 1 ? self.viewControllers[1] : nil
    }
    
    func toggleMasterView() {
        let barButtonItem = self.displayModeButtonItem
        
        //something here to hide bottom bar
        
        
        
        UIApplication.shared.sendAction(barButtonItem.action!, to: barButtonItem.target, from: nil, for: nil)
    }
}

extension UINavigationController {
    
    public func presentTransparentNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()
        setNavigationBarHidden(false, animated:true)
    }
    
    public func hideTransparentNavigationBar() {
        setNavigationBarHidden(true, animated:false)
        navigationBar.setBackgroundImage(UINavigationBar.appearance().backgroundImage(for: UIBarMetrics.default), for:.default)
        navigationBar.isTranslucent = UINavigationBar.appearance().isTranslucent
        navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
    }
}
