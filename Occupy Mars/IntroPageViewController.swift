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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        if let firstViewController = introViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        let path = Bundle.main.path(forResource: "background", ofType: "mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayerActionAtItemEnd.none;
        player!.isMuted = true
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
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
        
    }
    
    func playerItemDidReachEnd() {
        player!.seek(to: kCMTimeZero)
    }
    
    func applicationDidBecomeActive() {
        player!.seek(to: time, toleranceBefore: kCMTimeZero, toleranceAfter: kCMTimeZero)
        player?.play()
    }
    
    func applicationWillResignActive() {
        player?.pause()
        time = (player?.currentTime())!
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
