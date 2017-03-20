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

class MoonDetailViewController: UIViewController {
    @IBOutlet weak var globeButton: UIButton!
    @IBOutlet weak var scene: SCNView!
    @IBOutlet weak var sceneHeight: NSLayoutConstraint!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var tabs: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    //@IBOutlet weak var contentHeight: NSLayoutConstraint!
    @IBOutlet weak var tabsHeight: NSLayoutConstraint!
    @IBAction func indexChanged(_ sender: UISegmentedControl)
    {
        if let vc = getDetailViewController(sender.selectedSegmentIndex) {
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: vc)
            self.currentViewController = vc
        }
    }
    
    var moon: Moon!
    var currentViewController: UIViewController?
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        newViewController.view.translatesAutoresizingMaskIntoConstraints = false
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        self.addSubview(subView: newViewController.view, toView:self.content!)
        newViewController.view.alpha = 0
        newViewController.view.setNeedsLayout()
        newViewController.view.layoutIfNeeded()
        newViewController.view.layoutSubviews()
        content.reloadInputViews()
        UIView.animate(withDuration: 0.5,
                       animations: {
                        newViewController.view.alpha = 1
                        oldViewController.view.alpha = 0
        },
                       completion: { finished in
                        oldViewController.view.removeFromSuperview()
                        oldViewController.removeFromParentViewController()
                        newViewController.didMove(toParentViewController: self)
                        self.content.reloadInputViews()
                        //self.contentHeight.constant = newViewController.view.bounds.height
        })
    }
    
    func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
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
        
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 4)
        scrollView.indicatorStyle = UIScrollViewIndicatorStyle.white
        
        self.navigationItem.title = moon.name
                
        tabs.removeAllSegments()
        
        if moon.images.count > 0 || moon.videos.count > 0 {
            tabs.insertSegment(withTitle: "Media", at: 0, animated: true)
        }
        
        if moon.hasDetails {
            tabs.insertSegment(withTitle: "Details", at: 0, animated: true)
        }
        
        tabs.insertSegment(withTitle: "About", at: 0, animated: true)
        tabs.selectedSegmentIndex = 0
        
        if let vc = self.getDetailViewController(tabs.selectedSegmentIndex) {
            self.currentViewController = vc
            self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
            self.addChildViewController(self.currentViewController!)
            self.addSubview(subView: self.currentViewController!.view, toView: self.content)
        }
        
        if let let_scene = moon.getScene(size: Size.medium) {
            scene.scene = let_scene
        } else {
            globeButton.isHidden = true
            sceneHeight.constant = 0
        }
        
        if tabs.numberOfSegments < 2 {
            tabsHeight.constant = 0
            tabs.isUserInteractionEnabled = false
            tabs.alpha = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getDetailViewController(_ index: Int) -> UIViewController? {
        var vc: UIViewController!
        switch tabs.titleForSegment(at: index)! {
        case "About":
            var temp_vc: MoonGeneralAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "moonGeneralView") as! MoonGeneralAboutViewController?
            temp_vc!.moon = moon
            vc = temp_vc!
        case "Details":
            var temp_vc: MoonDetailsAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "moonDetailsView") as! MoonDetailsAboutViewController?
            temp_vc!.moon = moon
            vc = temp_vc!
        case "Media":
            var temp_vc: MoonMediaAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "moonMediaView") as! MoonMediaAboutViewController?
            temp_vc!.moon = moon
            vc = temp_vc!
        default:
            vc = self.storyboard?.instantiateViewController(withIdentifier: "test1") as UIViewController?
        }
        return vc
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "globeSegue") {
            let globe = segue.destination as! MoonGlobeViewController
            globe.moon = moon
        }
    }
}

