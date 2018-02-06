//
//  IntroPageViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 10/22/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit
import AVFoundation

class IntroPageViewController: UIPageViewController {
    
    var player: AVPlayer?
    var time = kCMTimeZero
    var playerLayer: AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        if let firstViewController = introViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print(error)
        }
        
        let path = Bundle.main.path(forResource: "background", ofType: "mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayerActionAtItemEnd.none;
        player!.isMuted = true
        player!.volume = 0
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = self.view.frame //.layer.bounds
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        self.view.layer.insertSublayer(playerLayer!, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(IntroPageViewController.playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: kCMTimeZero)
        player!.play()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(IntroPageViewController.applicationDidBecomeActive),
            name: NSNotification.Name.UIApplicationDidBecomeActive,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(IntroPageViewController.applicationWillResignActive),
            name: NSNotification.Name.UIApplicationWillResignActive,
            object: nil)
        
//        //parallax
//        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
//        verticalMotionEffect.minimumRelativeValue = -50
//        verticalMotionEffect.maximumRelativeValue = 50
//        
//        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
//        horizontalMotionEffect.minimumRelativeValue = -50
//        horizontalMotionEffect.maximumRelativeValue = 50
//        
//        let group = UIMotionEffectGroup()
//        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
//        self.view.addMotionEffect(group)
    }
    
    @objc func playerItemDidReachEnd() {
        player!.seek(to: kCMTimeZero)
    }
    
    @objc func applicationDidBecomeActive() {
        player!.seek(to: time, toleranceBefore: kCMTimeZero, toleranceAfter: kCMTimeZero)
        player?.play()
    }
    
    @objc func applicationWillResignActive() {
        player?.pause()
        time = (player?.currentTime())!
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            self.playerLayer?.frame = self.view.frame
        }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
        })
        super.viewWillTransition(to: size, with: coordinator)
    }
}

var introViewControllers = getViewControllers()

func getViewControllers() -> [UIViewController] {
    return [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IntroView1"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IntroView2"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IntroView3")]
}

extension IntroPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = introViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard introViewControllers.count > previousIndex else {
            return nil
        }
        return introViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = introViewControllers.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = introViewControllers.count
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        return introViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return introViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = introViewControllers.index(of: firstViewController) else {
                return 0
        }
        return firstViewControllerIndex
    }
}
