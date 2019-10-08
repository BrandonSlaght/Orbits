//
//  Extensions.swift
//  Occupy Mars
//
//  Created by Admin on 5/14/17.
//  Copyright © 2017 Slaght, Brandon. All rights reserved.
//

import Foundation
import UIKit

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
        UIApplication.shared.sendAction(barButtonItem.action!, to: barButtonItem.target, from: nil, for: nil)
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        print("asking to collapse secondary view controller")
        return true
    }
}
