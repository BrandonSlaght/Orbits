//
//  DetailsAboutViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/5/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class DetailsAboutViewController: AboutViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var geologyTable: UITableView!
    @IBOutlet weak var orbitTable: UITableView!
    @IBOutlet weak var miscTable: UITableView!
    //@IBOutlet weak var otherTable: UITableView!
    @IBOutlet weak var geologyHeight: NSLayoutConstraint!
    @IBOutlet weak var orbitHeight: NSLayoutConstraint!
    @IBOutlet weak var miscHeight: NSLayoutConstraint!
    
    var geology = [(String, String, String)]()
    var orbit = [(String, String, String)]()
    var misc = [(String, String)]()
    
    let tipView = EasyTipView(text: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        geology = planet.generateGeologyObjects()
        orbit = planet.generateOrbitalObjects()
        misc = planet.generateMiscObjects()

        geologyTable.delegate = self
        geologyTable.dataSource = self
        geologyTable.register(UINib(nibName: "DataViewCell", bundle: nil), forCellReuseIdentifier: "geologyCell")
        
        orbitTable.delegate = self
        orbitTable.dataSource = self
        orbitTable.register(UINib(nibName: "DataViewCell", bundle: nil), forCellReuseIdentifier: "orbitCell")
        
        miscTable.delegate = self
        miscTable.dataSource = self
        miscTable.register(UINib(nibName: "DataViewCell", bundle: nil), forCellReuseIdentifier: "miscCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        geologyTable.layoutIfNeeded()
        geologyHeight.constant = geologyTable.contentSize.height
        
        orbitTable.layoutIfNeeded()
        orbitHeight.constant = orbitTable.contentSize.height
        
        miscTable.layoutIfNeeded()
        miscHeight.constant = miscTable.contentSize.height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView == self.geologyTable {
            count = geology.count
        } else if tableView == self.orbitTable {
            count = orbit.count
        } else if tableView == self.miscTable {
            count = misc.count
        }
        return count!
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let subviews = cell.subviews
//        print("here")
//        print(tableView.numberOfRows(inSection: 0)-1)
//        print(indexPath.row)
//        if indexPath.row == (tableView.numberOfRows(inSection: 0) - 1) && subviews.count >= 3 {
//            print ("here2")
//            for subview in subviews {
//                if subview != cell.contentView {
//                    subview.removeFromSuperview()
//                }
//            }
//        }
//    }
    
    func superscript(string: String, fontName: String, size: Int) -> NSAttributedString {
        let font:UIFont? = UIFont(name: fontName, size: CGFloat(size))
        let fontSuper:UIFont? = UIFont(name: fontName, size: CGFloat(size/2) + 2)
        let copy = string.replacingOccurrences(of: "^", with: "")
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: copy, attributes: [NSFontAttributeName:font!])
        
        if let let_index = string.characters.index(of: Character("^")) {
            let pos = copy.characters.distance(from: copy.startIndex, to: let_index)
            let length = copy.characters.distance(from: let_index, to: copy.endIndex)
            attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:10], range: NSRange(location: pos, length: length))
            return attString;
        } else {
            return NSAttributedString(string: string)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell: DataViewCellViewController
        
        let singleTap = UITapGestureRecognizer()
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        singleTap.cancelsTouchesInView = false;

        if tableView == self.geologyTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "geologyCell", for: indexPath as IndexPath) as! DataViewCellViewController
            let previewDetail = geology[indexPath.row]
            cell.field!.text = previewDetail.0
            let value = NSMutableAttributedString()
            value.append(superscript(string: previewDetail.1, fontName: cell.value.font.fontName, size: Int(cell.value.font.pointSize)))
            value.append(NSAttributedString(string: previewDetail.2))
            cell.value!.attributedText = value
            addTargets(key: previewDetail.0, gesture: singleTap, view: cell)
        } else if tableView == self.orbitTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "orbitCell", for: indexPath as IndexPath) as! DataViewCellViewController
            let previewDetail = orbit[indexPath.row]
            cell.field!.text = previewDetail.0
            let value = NSMutableAttributedString()
            value.append(superscript(string: previewDetail.1, fontName: cell.value.font.fontName, size: Int(cell.value.font.pointSize)))
            value.append(NSAttributedString(string: previewDetail.2))
            cell.value!.attributedText = value
            addTargets(key: previewDetail.0, gesture: singleTap, view: cell)
        } else {//if tableView == self.orbitTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "miscCell", for: indexPath as IndexPath) as! DataViewCellViewController
            let previewDetail = misc[indexPath.row]
            cell.field!.text = previewDetail.0
            cell.value!.text = previewDetail.1
            addTargets(key: previewDetail.0, gesture: singleTap, view: cell)
        }
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.clear
        } else {
            cell.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.1)
        }
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = true
        cell.field.isUserInteractionEnabled = true
        cell.value.isUserInteractionEnabled = true
        return cell
    }
    
    func addTargets(key: String, gesture: UITapGestureRecognizer, view: UIView) {
        gesture.cancelsTouchesInView = false
        print("here1")
        switch key {
        case "Mass":
            print("here4")
            view.tag = 1
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addMass(_:)))
            view.addGestureRecognizer(gesture)
        default:
            print("here5")
            view.tag = 2
            gesture.addTarget(self, action: #selector(DetailsAboutViewController.addVolume(_:)))
            view.addGestureRecognizer(gesture)
        }
    }
    
    func addMass(_ sender: UITapGestureRecognizer) {
        print("here2")
        let tip = EasyTipView(text: "mass test LOREM IPSUM DOLOR SEDET BLAH BLAH BLAH BLAH BLAH ")
        tip.show(forView: self.view.viewWithTag(1)!)
    }
    
    func addVolume(_ sender: UITapGestureRecognizer) {
        print("here3")
        let tip = EasyTipView(text: "volume test")
        tip.show(forView: self.view.viewWithTag(2)!)
    }
    
}
