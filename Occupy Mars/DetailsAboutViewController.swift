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
    
    var geology = [(String, String)]()
    var orbit = [(String, String)]()
    var misc = [(String, String)]()

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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell: DataViewCellViewController

        if tableView == self.geologyTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "geologyCell", for: indexPath as IndexPath) as! DataViewCellViewController
            let previewDetail = geology[indexPath.row]
            cell.field!.text = previewDetail.0
            cell.value!.text = previewDetail.1
        } else if tableView == self.orbitTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "orbitCell", for: indexPath as IndexPath) as! DataViewCellViewController
            let previewDetail = orbit[indexPath.row]
            cell.field!.text = previewDetail.0
            cell.value!.text = previewDetail.1
        } else {//if tableView == self.orbitTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "miscCell", for: indexPath as IndexPath) as! DataViewCellViewController
            let previewDetail = misc[indexPath.row]
            cell.field!.text = previewDetail.0
            cell.value!.text = previewDetail.1
        }
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.clear
        } else {
            cell.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.1)
        }
        cell.selectionStyle = .none
        return cell
    }
}
