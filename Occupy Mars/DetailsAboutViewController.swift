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
    
    struct PreviewDetail {
        let title: String
        let preferredHeight: Double
    }
    
    let sampleData = [
        PreviewDetail(title: "Small", preferredHeight: 160.0),
        PreviewDetail(title: "Medium", preferredHeight: 320.0),
        PreviewDetail(title: "Large", preferredHeight: 0.0), // 0.0 to get the default height.
        PreviewDetail(title: "One", preferredHeight: 160.0),
        PreviewDetail(title: "Two", preferredHeight: 320.0),
        PreviewDetail(title: "Three", preferredHeight: 0.0), // 0.0 to get the default height.
        PreviewDetail(title: "More", preferredHeight: 0.0) // 0.0 to get the default height.
    ]
    
    let sampleData1 = [
        PreviewDetail(title: "One", preferredHeight: 160.0),
        PreviewDetail(title: "Two", preferredHeight: 320.0),
        PreviewDetail(title: "Three", preferredHeight: 0.0), // 0.0 to get the default height.
        PreviewDetail(title: "More", preferredHeight: 0.0) // 0.0 to get the default height.
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        geologyTable.delegate = self
        geologyTable.dataSource = self
        geologyTable.register(UITableViewCell.self, forCellReuseIdentifier: "detailCell")
        
        //geologyHeight.constant = geologyTable.contentSize.height
//        geologyTable.reloadData()
//        geologyTable.layoutIfNeeded()
//        geologyTable.invalidateIntrinsicContentSize()
//        geologyTable.sizeToFit()
        
//        geologyTable.dataSource = self
//        geologyTable.delegate = self
//        geologyTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        
        print("help")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        geologyTable.layoutIfNeeded()
        geologyHeight.constant = geologyTable.contentSize.height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("rowsinsection")
        // Return the number of items in the sample data structure.
        
        var count:Int?
        
        //if geologyTable == self.geologyTable {
            count = sampleData.count
        //}
        
//        if geologyTable == self.geologyTable {
//            count =  sampleData1.count
//        }
//        
        return count!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellforrowat")
        
        var cell:UITableViewCell?
        
        if tableView == self.geologyTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath as IndexPath)
            let previewDetail = sampleData[indexPath.row]
            cell!.textLabel!.text = previewDetail.title
            
        }
        
//        if geologyTable == self.geologyTable {
//            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
//            let previewDetail = sampleData1[indexPath.row]
//            cell!.textLabel!.text = previewDetail.title
//            
//        }
        
        
        //geologyHeight.constant = geologyTable.contentSize.height
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        print("did select:      \(indexPath.row)  ")
    }
    
    
    
}
