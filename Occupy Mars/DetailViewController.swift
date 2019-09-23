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
        if let vc = getDetailViewController(sender.selectedSegmentIndex) {
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: vc)
            self.currentViewController = vc
        }
        scrollViewDidScroll(scrollView)
    }
    
    var body: Body!
    var currentViewController: UIViewController?
    var navigationBarOriginalOffset : CGFloat?
    var extraPadding: CGFloat!
    var barColor: UIColor!
    var tabColor: UIColor!
    var transitioning = false
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        //transitioning = true
        newViewController.view.translatesAutoresizingMaskIntoConstraints = false
        oldViewController.willMove(toParent: nil)
        self.addChild(newViewController)
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
                                    oldViewController.removeFromParent()
                                    newViewController.didMove(toParent: self)
                                    self.content.reloadInputViews()
                                    self.transitioning = false
                                    self.scrollViewDidScroll(self.scrollView)
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
        
        if body == nil {
            body = Objects.earth()
        }
        
        scrollView.delegate = self
        
        let singleTap = UITapGestureRecognizer()
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        singleTap.cancelsTouchesInView = false;
        singleTap.addTarget(self, action: #selector(DetailViewController.hide(_:)))
        self.view.addGestureRecognizer(singleTap)

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.layer.zPosition = -1
        blurView.isUserInteractionEnabled = false
        
        if let let_background = body.background {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: let_background)!)
        } else {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "milkyway.jpg")!)
        }
        
        self.view.addSubview(blurView)
        
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 4)
        scrollView.indicatorStyle = UIScrollView.IndicatorStyle.white
        
        self.navigationItem.title = body.name
        
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
        
        if let let_scene = body.getScene(size: Size.medium) {
            scene.scene = let_scene
            scene.isPlaying = true
            scene.antialiasingMode = .multisampling4X
        } else {
            globeButton.isHidden = true
            sceneHeight.constant = 0
            if let let_color = body.color1 {
                tabHolder.backgroundColor = let_color
            } else {
                tabHolder.backgroundColor = barColor
            }
        }
        
        insideView.bringSubviewToFront(tabHolder)
        
        globeButton.addTarget(self, action: #selector(globeSegue), for: .touchUpInside)
        
        extraPadding = 0
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .never

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
        
        animateNav()
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
    
    func getDetailViewController(_ index: Int) -> UIViewController? {
        var vc: UIViewController!
        switch tabs.titleForSegment(at: index)! {
        case "About":
            var temp_vc: GeneralAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "generalView") as! GeneralAboutViewController?
            temp_vc!.body = body
            vc = temp_vc!
        case "Details":
            var temp_vc: DetailsAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "detailsView") as! DetailsAboutViewController?
            temp_vc!.body = body
            vc = temp_vc!
        case "Moons":
            var temp_vc: MoonAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "moonView") as! MoonAboutViewController?
            temp_vc!.body = body
            vc = temp_vc!
        case "Media":
            var temp_vc: MediaAboutViewController?
            temp_vc = self.storyboard?.instantiateViewController(withIdentifier: "mediaView") as! MediaAboutViewController?
            temp_vc!.body = body
            vc = temp_vc!
        default:
            vc = self.storyboard?.instantiateViewController(withIdentifier: "mediaView") as UIViewController?
        }
        return vc
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (sceneHeight.constant == 0) {
            tabHolder.frame.origin.y = scrollView.contentOffset.y + extraPadding
        } else {
            if (!transitioning) {
                if (navigationBarOriginalOffset! <= scrollView.contentOffset.y + extraPadding) {
                    tabHolder.frame.origin.y = scrollView.contentOffset.y + extraPadding
                    if let let_color = body.color1 {
                        tabHolder.backgroundColor = let_color
                    } else {
                        tabHolder.backgroundColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
                    }
                } else {
                    tabHolder.frame.origin.y = navigationBarOriginalOffset!
                    tabHolder.backgroundColor = UIColor.clear
                }
            }
        }
        BTBalloon.sharedInstance().hide()
    }
    
    func statusBarHeight() -> CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return min(statusBarSize.width, statusBarSize.height)
    }
    
    @objc func globeSegue(){
        let globe = self.storyboard?.instantiateViewController(withIdentifier: "globeView") as? GlobeViewController
        globe?.body = body
        self.splitViewController?.toggleMasterView()

        if self.splitViewController?.secondaryViewController == nil {
            globe!.hidesBottomBarWhenPushed = true
        }
        
        self.navigationController?.pushViewController(globe!, animated: true)
        
        BTBalloon.sharedInstance().hide()
    }
    
    func animateNav() {
        guard let coordinator = self.transitionCoordinator else {
            return
        }
        
        coordinator.animate(alongsideTransition: {
            [weak self] context in self?.setNavColors()
            }, completion: nil)
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
            let gray = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
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
