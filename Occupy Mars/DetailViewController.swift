//
//  DetailViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/1/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit
import SceneKit
import QuartzCore

class DetailViewController: UIViewController {
    @IBOutlet weak var scene: SCNView!
    @IBOutlet weak var sceneHeight: NSLayoutConstraint!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var tabs: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentHeight: NSLayoutConstraint!
    @IBAction func indexChanged(_ sender: UISegmentedControl)
    {
        if let vc = getDetailViewController(sender.selectedSegmentIndex) {
            //var height = vc.view.bounds.height
            //print(height)
            self.addChildViewController(vc)
            self.transition(from: self.currentViewController!, to: vc, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                self.currentViewController!.view.removeFromSuperview()
                vc.view.frame = self.content.bounds
                self.content.addSubview(vc.view)
                }, completion: { finished in
                    //vc.didMove(toParentViewController: self)
                    //vc.view.layoutSubviews()
                    //vc.view.layoutIfNeeded()
                    //height = vc.view.bounds.height
                    //self.contentHeight.constant = height
                    self.currentViewController!.removeFromParentViewController()
                    self.currentViewController = vc
                    //print(height)
                }
            )        
        }
    }
    
    var planet: Planet!
    var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = UIImageView(image: UIImage(named: "milkyway.jpg")!)
        background.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.layer.zPosition = -1
        blurView.isUserInteractionEnabled = false
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "milkyway.jpg")!)
        self.view.addSubview(blurView)
        
        content.autoresizesSubviews = true
        
        //content.frame = view.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
//        content.autoresizingMask = UIView.resizin
        
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 4)
        scrollView.indicatorStyle = UIScrollViewIndicatorStyle.white
        
        self.navigationItem.title = planet.name
        
        //tabs.tintColor = UIVibrancyEffect(forBlurEffect: blurView.effect as! UIBlurEffect)
        
        tabs.removeAllSegments()
        
        if planet.images.count > 0 || planet.videos.count > 0 {
            tabs.insertSegment(withTitle: "Media", at: 0, animated: true)
        }
        
        if planet.rings.count > 0 {
            tabs.insertSegment(withTitle: "Rings", at: 0, animated: true)
        }
        
        if planet.moons.count > 0 {
            tabs.insertSegment(withTitle: "Moons", at: 0, animated: true)
        }
        
        tabs.insertSegment(withTitle: "Details", at: 0, animated: true)
        tabs.insertSegment(withTitle: "About", at: 0, animated: true)
        tabs.selectedSegmentIndex = 0
        
        if let vc = self.getDetailViewController(tabs.selectedSegmentIndex) {
            vc.view.frame = self.content.bounds
            self.addChildViewController(vc)
            self.content.addSubview(vc.view)
            self.currentViewController = vc
        }
        
        if let let_scene = planet.getScene(Size.medium) {
            scene.scene = let_scene
        } else {
            sceneHeight.constant = 0
        }
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        content.autoresizingMask.insert(.FlexibleHeight)
//        content.autoresizingMask.insert(.FlexibleWidth)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getDetailViewController(_ index: Int) -> UIViewController? {
        var vc: UIViewController!
        switch tabs.titleForSegment(at: index)! {
        case "About":
            var temp_vc: GeneralAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "generalView") as! GeneralAboutViewController?
            temp_vc!.planet = planet
            vc = temp_vc!
        case "Details":
            var temp_vc: DetailsAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "detailsView") as! DetailsAboutViewController?
            temp_vc!.planet = planet
            vc = temp_vc!
        case "Moons":
            var temp_vc: MoonsAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "moonsView") as! MoonsAboutViewController?
            temp_vc!.planet = planet
            vc = temp_vc!
        case "Media":
            var temp_vc: MediaAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "mediaView") as! MediaAboutViewController?
            temp_vc!.planet = planet
            vc = temp_vc!
        default:
            vc = self.storyboard?.instantiateViewController(withIdentifier: "test1") as UIViewController?
        }
        return vc
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "globeSegue") {
            let globe = segue.destination as! GlobeViewController
            globe.planet = planet
        }
    }
}

