//
//  PeekViewController.swift
//  Occupy Mars
//
//  Created by Brandon Slaght on 10/14/17.
//  Copyright © 2017 Slaght, Brandon. All rights reserved.
//

import Foundation

class PeekViewController: UIViewController {
    
    @IBOutlet weak var imageHolder: UIImageView!
    @IBOutlet weak var imageHolderHeight: NSLayoutConstraint!
    
    var imageObject = UIImage()
    var imageTitle = ""
    
    //func PeekViewController() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageHolder.image = imageObject
        imageHolder.sizeToFit()
        if let image = imageHolder.image {
            self.preferredContentSize = CGSize(width: image.size.width, height: image.size.height)
        }
        
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        let saveAction = UIPreviewAction(title: "Save", style: .default) { (action: UIPreviewAction, vc: UIViewController) -> Void in
            UIImageWriteToSavedPhotosAlbum(self.imageObject, nil, nil, nil);
        }
        
        let shareAction = UIPreviewAction(title: "Share", style: .default) { (action: UIPreviewAction, vc: UIViewController) -> Void in
            
            // image to share
            let image = self.imageObject
            
            // set up activity view controller
            //let imageToShare = [ image ]
            let activityViewController = UIActivityViewController(activityItems: [(image), self.imageTitle], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            
            // present the view controller
            UIApplication.shared.delegate?.window??.rootViewController?.present(activityViewController, animated: true, completion: nil)
        }
        
        //let actionGroup = UIPreviewActionGroup(title: "Group...", style: .default, actions: [regularAction, destructiveAction])
        
        return [saveAction, shareAction]
    }
}
