//
//  TestViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/1/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//
import UIKit
import SceneKit

class TestViewController: UIViewController {
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l1l: NSLayoutConstraint!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var buton: UIButton!
    @IBOutlet weak var num: UILabel!
    @IBAction func btnpres(_ sender: AnyObject) {
        print("here")
        if let text1 = text.text {
            if let int = Int(text1) {
                num.text=String(int)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneSetup()
        animatel1()
        animatel2()
        animateBackground()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func sceneSetup() {
        //sceneView.scene = Objects.planets()[2].getScene(Size.Small)
    }
    
    func animateBackground() {
        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   options: [],
                                   animations: { () -> Void in
                                    self.view.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
                                    },
                                   completion: { (Bool) -> Void in
                                    UIView.animate(withDuration: 2.0,
                                        animations: { () -> Void in
                                            self.view.backgroundColor = UIColor(colorLiteralRed: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
                                        },
                                        completion: { (Bool) -> Void in
                                            self.animateBackground()
                                    })
        })
    }
    
    func animatel1() {
        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   options: [],
                                   animations: { () -> Void in
                                        self.l1.alpha = 0.0
                                        self.l2.alpha = 0.0
                                    },
                                   completion: { (Bool) -> Void in
                                        UIView.animate(withDuration: 2.0,
                                        animations: { () -> Void in
                                            self.l1.alpha = 1.0
                                            self.l2.alpha = 1.0
                                        },
                                        completion: { (Bool) -> Void in
                                            self.animatel1()
                                        }
                                    )
            }
        )
    }
    
    func animatel2() {
        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   options: [],
                                   animations: { () -> Void in
                                        self.l1l.constant *= 2
                                        self.l1l.constant -= 20
                                        self.view.layoutIfNeeded()
                                    },
                                   completion: { (Bool) -> Void in
                                        UIView.animate(withDuration: 2.0,
                                        animations: { () -> Void in
                                            self.l1l.constant += 20
                                            self.l1l.constant /= 2
                                            self.view.layoutIfNeeded()
                                        },
                                        completion: { (Bool) -> Void in
                                            self.animatel2()
                                        }
                                    )
            }
        )
    }
}
