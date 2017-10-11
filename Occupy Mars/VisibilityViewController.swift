//
//  VisibilityViewController.swift
//  Occupy Mars
//
//  Created by Admin on 5/31/17.
//  Copyright © 2017 Slaght, Brandon. All rights reserved.
//

import UIKit

class VisibilityViewController: UIView {
    @IBOutlet weak var riseLabel: UILabel!
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var riseStart: UIView!
    @IBOutlet weak var setEnd: UIView!
    @IBOutlet weak var riseOutline: UIView!
    @IBOutlet weak var setOutline: UIView!
    
    var rise: Date!
    var set: Date!
    
    func setup(rise: Date, set: Date) {
        self.rise = rise
        self.set = set
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //var width = self.bounds.width
        //var height = self.bounds.height
        
        //0% width is 12:00AM, 100% width is 11:59PM
        //must schedule this to refresh at midnight
        
        //holy shit this is complicated, I need acceptance criteria
        
//        let today = Date()
        
//        let startOfToday = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: today)!
//        let startOfTomorrow =
            
//            .timeIntervalSinceReferenceDate
//        Date().add
//        let endInterval = endDate.timeIntervalSinceReferenceDate
//        
//        let startInterval = Date().timeIntervalSinceReferenceDate
//        endInterval = endDate.timeIntervalSinceReferenceDate
        
        
        
        //if it both rises and sets on the same day, we move both sides into each other
        
    }
}
