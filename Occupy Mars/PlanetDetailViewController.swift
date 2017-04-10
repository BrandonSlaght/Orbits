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

class PlanetDetailViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var tabHolder: UIView!
    @IBOutlet weak var scene: SCNView!
    @IBOutlet weak var sceneHeight: NSLayoutConstraint!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var tabs: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var globeButton: UIButton!
    @IBAction func indexChanged(_ sender: UISegmentedControl)
    {
        if let vc = getDetailViewController(sender.selectedSegmentIndex) {
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: vc)
            self.currentViewController = vc
        }
    }
    
    var planet: Planet!
    var currentViewController: UIViewController?
    var navigationBarOriginalOffset : CGFloat?
    var barColor: UIColor!
    
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
        
        scrollView.delegate = self

        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.layer.zPosition = -1
        blurView.isUserInteractionEnabled = false
        
        //blurTabView = UIVisualEffectView(effect: blurEffect)
        
        if let let_background = planet.background {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: let_background)!)
        } else {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "milkyway.jpg")!)
        }
        
        self.view.addSubview(blurView)
        
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 4)
        scrollView.indicatorStyle = UIScrollViewIndicatorStyle.white
        
        self.navigationItem.title = planet.name
        
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
            self.currentViewController = vc
            self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
            self.addChildViewController(self.currentViewController!)
            self.addSubview(subView: self.currentViewController!.view, toView: self.content)
        }
        
        if let let_scene = planet.getScene(size: Size.medium) {
            scene.scene = let_scene
        } else {
            globeButton.isHidden = true
            sceneHeight.constant = 0
        }
        
        //view.sendSubview(toBack: tabHolder)
        tabHolder.bringSubview(toFront: tabs)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        barColor = navigationController?.navigationBar.barTintColor
        if let let_color = planet.color1 {
            self.navigationController?.navigationBar.barTintColor =  let_color
        }
        navigationBarOriginalOffset = tabHolder.frame.origin.y
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = barColor
    }
    
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
            var temp_vc: MoonAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "moonView") as! MoonAboutViewController?
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tabHolder.frame.origin.y = max(navigationBarOriginalOffset!, scrollView.contentOffset.y)
        if (navigationBarOriginalOffset! < scrollView.contentOffset.y) {
            if let let_color = planet.color1 {
                tabHolder.backgroundColor = let_color
            } else {
                tabHolder.backgroundColor = barColor
            }
            print("smaller")
        } else {
            tabHolder.backgroundColor = UIColor.clear
            print("larger")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "globeSegue") {
            let globe = segue.destination as! GlobeViewController
            globe.planet = planet
        } else {
            segue.destination.view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

