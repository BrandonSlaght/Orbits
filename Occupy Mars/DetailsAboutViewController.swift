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
    //@IBOutlet weak var otherTable: UITableView!
    @IBOutlet weak var geologyHeight: NSLayoutConstraint!
    @IBOutlet weak var orbitHeight: NSLayoutConstraint!
    
    var geology = [(String, String)]()
    
//    struct PreviewDetail {
//        let title: String
//        let preferredHeight: Double
//    }
    
//    let sampleData = [
//        PreviewDetail(title: "Small", preferredHeight: 160.0),
//        PreviewDetail(title: "Medium", preferredHeight: 320.0),
//        PreviewDetail(title: "Large", preferredHeight: 0.0), // 0.0 to get the default height.
//        PreviewDetail(title: "One", preferredHeight: 160.0),
//        PreviewDetail(title: "Two", preferredHeight: 320.0),
//        PreviewDetail(title: "Three", preferredHeight: 0.0), // 0.0 to get the default height.
//        PreviewDetail(title: "More", preferredHeight: 0.0) // 0.0 to get the default height.
//    ]
//    
//    let sampleData1 = [
//        PreviewDetail(title: "One", preferredHeight: 160.0),
//        PreviewDetail(title: "Two", preferredHeight: 320.0),
//        PreviewDetail(title: "Three", preferredHeight: 0.0), // 0.0 to get the default height.
//        PreviewDetail(title: "More", preferredHeight: 0.0) // 0.0 to get the default height.
//    ]
//    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(planet.name)
        geology = planet.generateGeologyObjects()
        // Do any additional setup after loading the view, typically from a nib.
        let testCell = UITableViewCell(style: .subtitle, reuseIdentifier: "geologyCell")
        
        geologyTable.delegate = self
        geologyTable.dataSource = self
        geologyTable.register(testCell, forCellReuseIdentifier: "geologyCell")
        
        orbitTable.delegate = self
        orbitTable.dataSource = self
        orbitTable.register(UITableViewCell.self, forCellReuseIdentifier: "orbitCell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        geologyTable.layoutIfNeeded()
        geologyHeight.constant = geologyTable.contentSize.height
        
        orbitTable.layoutIfNeeded()
        orbitHeight.constant = geologyTable.contentSize.height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView == self.geologyTable {
            count = geology.count
        } else if tableView == self.orbitTable {
            count = geology.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = UITableViewCell(style: .subtitle, reuseIdentifier: "geologyCell")
//        if cell == nil {
//            cell = UITableViewCell(style: <#T##UITableViewCellStyle#>, reuseIdentifier: <#T##String?#>)
//        }
        if tableView == self.geologyTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "geologyCell", for: indexPath as IndexPath)
            let previewDetail = geology[indexPath.row]
            cell.textLabel!.text = previewDetail.0
            cell.detailTextLabel!.text = "sdfuygvlaiufr"
        } else if tableView == self.orbitTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "orbitCell", for: indexPath as IndexPath)
            print("here")
            let previewDetail = geology[indexPath.row]
            cell.textLabel!.text = previewDetail.0
        }
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.clear
        } else {
            cell.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.1)
        }
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
}
