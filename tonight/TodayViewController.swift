//
//  TodayViewController.swift
//  tonight
//
//  Created by Admin on 5/30/17.
//  Copyright © 2017 Slaght, Brandon. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var basicDataStackView: UIStackView!
    
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var moonPhaseLabel: UILabel!
    
    @IBOutlet weak var cloudCoverLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var lightPollutionLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var dayLengthLabel: UILabel!
    @IBOutlet weak var sunAngleLabel: UILabel!
    
    @IBOutlet weak var visibilityTableView: UITableView!
    @IBOutlet weak var visibilityTableViewHeightConstraint: NSLayoutConstraint!
    
    var objects: [Body] = []
    var sextant: Sextant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var allObjects = Objects.solarSystem()
        objects = allObjects[Class.Major]!
        objects.append(allObjects[Class.Other]![0])
        objects.append(allObjects[Class.Major]![2].moons[0])
        
        preferredContentSize = CGSize(width: 0, height: basicDataStackView.bounds.size.height)
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        visibilityTableView.delegate = self
        visibilityTableView.dataSource = self
        
        visibilityTableView.separatorEffect = UIVibrancyEffect(blurEffect: UIBlurEffect(style: .dark))
        visibilityTableView.estimatedRowHeight = 75
        visibilityTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        

        //completionHandler(loadData())
        //completionHandler(NCUpdateResult.newData)
    }
    
//    func loadData() -> NCUpdateResult{
//        sextant = Sextant()
//        //sextant.setCallbackFunction(loadVisibilityData())
//        loadWeatherData()
//
//
//    }
    
    func loadVisibilityData() {
        
    }
    
    func loadWeatherData() {
        
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .expanded {
            preferredContentSize = CGSize(width: 0, height: 600)
        } else {
            preferredContentSize = CGSize(width: 0, height: basicDataStackView.bounds.size.height)
        }
    }
    
    override func viewDidLayoutSubviews() {
        visibilityTableView.layoutIfNeeded()
        visibilityTableViewHeightConstraint.constant = visibilityTableView.contentSize.height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Objects.itemsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetsVisibleTonightCell", for: indexPath) as! VisibilityCell
        //let classification = Class.allValues[indexPath.section]
        let planet = objects[indexPath.row]
        cell.name?.text = planet.name

        //set image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let index = indexPath.row
        //let detail = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController
        //detail?.body = body.moons[index]
        //self.navigationController?.pushViewController(detail!, animated: true)
    }

}
