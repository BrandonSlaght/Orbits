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
    var time = CMTime.zero
    var playerLayer: AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupPlayer()
        setupParallaxEffect()
    }
    
    @objc func playerItemDidReachEnd() {
        player!.seek(to: CMTime.zero)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            self.playerLayer?.frame = self.view.frame
        }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
        })
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    func setupView() {
        dataSource = self
        if let firstViewController = introViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.ambient)))
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func setupPlayer() {
        let path = Bundle.main.path(forResource: "background", ofType: "mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none;
        player!.isMuted = true
        player!.volume = 0
        player!.seek(to: CMTime.zero)
        player!.play()
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspectFill
        NotificationCenter.default.addObserver(self, selector: #selector(IntroPageViewController.playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
    }
    
    func setupParallaxEffect() {
        let wrapperview = UIView()
        
        var bounds = self.view.bounds
        bounds.origin.x -= 50
        bounds.origin.y -= 50
        bounds.size.height += 100
        bounds.size.width += 100
        wrapperview.bounds = bounds
        
        var frame = self.view.frame
        frame.origin.x -= 50
        frame.origin.y -= 50
        frame.size.height += 100
        frame.size.width += 100
        wrapperview.frame = frame
        
        self.view.clipsToBounds = false
        wrapperview.clipsToBounds = false
        
        playerLayer?.frame = frame
        wrapperview.layer.insertSublayer(playerLayer!, at: 0)
        wrapperview.addMotionEffect(getMotionEffectGroup())
        self.view.addSubview(wrapperview)
        self.view.sendSubviewToBack(wrapperview)
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
        guard let viewControllerIndex = introViewControllers.firstIndex(of: viewController) else {
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
        guard let viewControllerIndex = introViewControllers.firstIndex(of: viewController) else {
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
            let firstViewControllerIndex = introViewControllers.firstIndex(of: firstViewController) else {
                return 0
        }
        return firstViewControllerIndex
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
