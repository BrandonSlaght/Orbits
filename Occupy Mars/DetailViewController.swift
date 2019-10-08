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

class DetailViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var tabHolderHeight: NSLayoutConstraint!
    @IBOutlet weak var tabHeight: NSLayoutConstraint!
    @IBOutlet weak var insideView: UIView!
    @IBOutlet weak var tabHolder: UIView!
    @IBOutlet weak var scene: SCNView!
    @IBOutlet weak var sceneHeight: NSLayoutConstraint!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var tabs: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var globeButton: UIButton!
    @IBAction func indexChanged(_ sender: UISegmentedControl)
    {
        BTBalloon.sharedInstance().hide()
        transitioning = true
        if let viewController = getDetailViewController(sender.selectedSegmentIndex) {
            viewController.view.translatesAutoresizingMaskIntoConstraints = false
            self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: viewController)
            self.currentViewController = viewController
        }
        scrollViewDidScroll(scrollView)
    }
    
    var body: Body!
    var currentViewController: UIViewController?
    var navigationBarOriginalOffset : CGFloat?
    var barColor: UIColor!
    var tabColor: UIColor!
    var extraPadding: CGFloat = 0.0
    var transitioning = false
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        newViewController.view.translatesAutoresizingMaskIntoConstraints = false
        oldViewController.willMove(toParent: nil)
        self.addChild(newViewController)
        self.addSubview(subView: newViewController.view, toView:self.content!)
        newViewController.view.alpha = 0
        newViewController.view.setNeedsLayout()
        newViewController.view.layoutIfNeeded()
        newViewController.view.layoutSubviews()
        content.reloadInputViews()
        animateViewControllerFrom(old: oldViewController, new: newViewController)
    }
    
    func animateViewControllerFrom(old: UIViewController, new: UIViewController) {
        UIView.animate(withDuration: 0.5,
        animations: {
             new.view.alpha = 1
             old.view.alpha = 0
        },
        completion: { finished in
             old.view.removeFromSuperview()
             old.removeFromParent()
             new.didMove(toParent: self)
             self.content.reloadInputViews()
             self.transitioning = false
             self.scrollViewDidScroll(self.scrollView)
        })
    }
    
    func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|", options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|", options: [], metrics: nil, views: viewBindingsDict))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if body == nil {
            body = Objects.mercury()
        }
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = body.name
        
        scrollView.delegate = self
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 4)
        scrollView.indicatorStyle = UIScrollView.IndicatorStyle.white
        
        setupBalloonHideGestureRecognizer()
        setupBackground()
        setupTabs()
        setupSceneView()
        
        insideView.bringSubviewToFront(tabHolder)
        globeButton.addTarget(self, action: #selector(globeSegue), for: .touchUpInside)
        moveTagToBack(ofNav: self.navigationController!)
    }
    
    @objc func hide(_ sender: UITapGestureRecognizer) {
        BTBalloon.sharedInstance().hide()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        moveTagToBack(ofNav: self.navigationController!)
        
        barColor = navigationController?.navigationBar.barTintColor
        tabColor = tabBarController?.tabBar.barTintColor

        setNavColors()
        
        if (navigationBarOriginalOffset == nil) {
            navigationBarOriginalOffset = tabHolder.frame.origin.y
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moveTagToBack(ofNav: self.navigationController!)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        BTBalloon.sharedInstance().hide()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupBalloonHideGestureRecognizer() {
        let singleTap = UITapGestureRecognizer()
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        singleTap.cancelsTouchesInView = false;
        singleTap.addTarget(self, action: #selector(DetailViewController.hide(_:)))
        self.view.addGestureRecognizer(singleTap)
    }
    
    func setupBackground() {
        let backgroundView: UIView
        if let let_background = body.background {
            backgroundView = setupParallaxEffect(parentView: getBlurViewWithBackground(frame: view.bounds, background: let_background))
        } else {
            backgroundView = setupParallaxEffect(parentView: getBlurViewWithBackground(frame: view.bounds, background: "milkyway.jpg"))
        }
        self.view.addSubview(backgroundView)
        self.view.sendSubviewToBack(backgroundView)
    }
    
    func setupTabs() {
        tabs.removeAllSegments()
        
        if body.images.count > 0 || body.videos.count > 0 {
            tabs.insertSegment(withTitle: "Media", at: 0, animated: false)
        }
        if body.rings.count > 0 {
            tabs.insertSegment(withTitle: "Rings", at: 0, animated: false)
        }
        if body.moons.count > 0 {
            tabs.insertSegment(withTitle: "Moons", at: 0, animated: false)
        }
        if body.hasDetails {
            tabs.insertSegment(withTitle: "Details", at: 0, animated: false)
        }
        
        tabs.insertSegment(withTitle: "About", at: 0, animated: false)
        tabs.selectedSegmentIndex = 0
        
        if tabs.numberOfSegments < 2 {
            tabHeight.constant = 0
            tabs.isUserInteractionEnabled = false
            tabs.alpha = 0
        }
        
        if let vc = self.getDetailViewController(tabs.selectedSegmentIndex) {
            self.currentViewController = vc
            self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
            self.addChild(self.currentViewController!)
            self.addSubview(subView: self.currentViewController!.view, toView: self.content)
        }
    }
    
    func setupSceneView() {
        if let let_scene = body.getScene(size: Size.medium) {
            scene.scene = let_scene
            scene.isPlaying = true
            scene.antialiasingMode = .multisampling4X
        } else {
            globeButton.isHidden = true
            sceneHeight.constant = 0
            adjustColor(to: body.color1, or: barColor)
        }
    }
    
    func getDetailViewController(_ index: Int) -> UIViewController? {
        var vc: AboutViewController!
        switch tabs.titleForSegment(at: index)! {
            case "About":
                vc = self.storyboard?.instantiateViewController(withIdentifier: "generalView") as! GeneralAboutViewController?
            case "Details":
                vc = self.storyboard?.instantiateViewController(withIdentifier: "detailsView") as! DetailsAboutViewController?
            case "Moons":
                vc = self.storyboard?.instantiateViewController(withIdentifier: "moonView") as! MoonAboutViewController?
            case "Media":
                vc = self.storyboard?.instantiateViewController(withIdentifier: "mediaView") as! MediaAboutViewController?
           default:
                vc = self.storyboard?.instantiateViewController(withIdentifier: "mediaView") as! MediaAboutViewController?
        }
        vc.body = body
        return vc
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (sceneHeight.constant == 0) {
            tabHolder.frame.origin.y = scrollView.contentOffset.y + extraPadding
        } else if (!transitioning) {
            if (navigationBarOriginalOffset! <= scrollView.contentOffset.y + extraPadding) {
                tabHolder.frame.origin.y = scrollView.contentOffset.y + extraPadding
                adjustColor(to: body.color1, or: UIColor.Orbits.SpaceGray)
            } else {
                tabHolder.frame.origin.y = navigationBarOriginalOffset!
                tabHolder.backgroundColor = UIColor.clear
            }
        }
        BTBalloon.sharedInstance().hide()
    }
    
    func adjustColor(to color: UIColor?, or otherColor: UIColor) {
        if let let_color = color {
            tabHolder.backgroundColor = let_color
        } else {
            tabHolder.backgroundColor = otherColor
        }
    }
    
    func statusBarHeight() -> CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return min(statusBarSize.width, statusBarSize.height)
    }
    
    @objc func globeSegue(){
        let globe = self.storyboard?.instantiateViewController(withIdentifier: "globeView") as? GlobeViewController
        globe?.body = body
        
        self.navigationController?.pushViewController(globe!, animated: true)
        
        BTBalloon.sharedInstance().hide()
    }
    
    
    func setNavColors() {
        if let let_color = body.color1 {
            tabBarController?.tabBar.barTintColor = let_color
            //we are on an iPad and don't have to do anything fucked up
            if splitViewController?.secondaryViewController != nil {
                navigationController?.navigationBar.barTintColor = let_color
            } else { //we are on an iPhone :(
                (self.splitViewController?.primaryViewController as! UINavigationController).navigationBar.barTintColor = let_color
            }
        } else {
            let gray = UIColor.Orbits.SpaceGray
            tabBarController?.tabBar.barTintColor = gray
            if splitViewController?.secondaryViewController != nil {
                navigationController?.navigationBar.barTintColor = gray
            } else {
                (self.splitViewController?.primaryViewController as! UINavigationController).navigationBar.barTintColor = gray
            }
        }
    }
    
    override func willMove(toParent parent: UIViewController?) { // tricky part in iOS 10
        navigationController?.navigationBar.barTintColor = .red //previous color
        super.willMove(toParent: parent)
    }
}
