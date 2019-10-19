//
//  MediaAboutViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/5/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class MediaAboutViewController: AboutViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerPreviewingDelegate, UICollectionViewDragDelegate, CHTCollectionViewDelegateWaterfallLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
        
    var images = [SKPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.dragDelegate = self
        self.collectionView.dragInteractionEnabled = true
        
        setupCollectionView()
        registerNibs()
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.layoutIfNeeded()
        collectionViewHeight.constant = collectionView.contentSize.height
        
        guard traitCollection.forceTouchCapability == .available else { return }
        registerForPreviewing(with: self, sourceView: collectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupCollectionView(){
        let layout = CHTCollectionViewWaterfallLayout()
        layout.minimumColumnSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        if body.images.count > 1 {
            layout.columnCount = 2
        } else {
            layout.columnCount = 1
        }
        self.collectionView.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight, UIView.AutoresizingMask.flexibleWidth]
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.collectionViewLayout = layout
        for image in body.images {
            let item = SKPhoto.photoWithImage(UIImage(named: image.image)!)
            item.caption = image.caption
            images.append(item)
        }
    }
    
     func registerNibs(){
        let viewNib = UINib(nibName: "MediaViewCell", bundle: nil)
        collectionView.register(viewNib, forCellWithReuseIdentifier: "cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return body.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaHolder
        cell.image.image = UIImage(named: body.images[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        UIImage(named: body.images[indexPath.row].image)!.size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MediaHolder
        let originImage = cell.image.image!
        
        let browser = SKPhotoBrowser(originImage: originImage, photos: images, animatedFromView: cell)
        SKPhotoBrowserOptions.bounceAnimation = true
        browser.initializePageIndex(indexPath.row)
        present(browser, animated: true, completion: {})
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = collectionView?.indexPathForItem(at: location) else { return nil }
        guard let cell = collectionView?.cellForItem(at: indexPath) else { return nil }
        previewingContext.sourceRect = cell.frame
        
        guard let mediaHolderViewController = storyboard?.instantiateViewController(withIdentifier: "ImagePeekView") as? PeekViewController else {
            return nil
        }
        
        let image = images[indexPath.row]
        mediaHolderViewController.image = image.underlyingImage!
        mediaHolderViewController.imageTitle = image.caption
        mediaHolderViewController.preferredContentSize = CGSize(width: 0.0, height: 0.0)
        return mediaHolderViewController
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        let location = CGPoint(x: previewingContext.sourceRect.midX, y: previewingContext.sourceRect.midY)
        let indexPath = collectionView?.indexPathForItem(at: location)
        let cell = collectionView?.cellForItem(at: indexPath!) as! MediaHolder
        let originImage = cell.image.image!
        
        let browser = SKPhotoBrowser(originImage: originImage, photos: images, animatedFromView: cell)
        SKPhotoBrowserOptions.bounceAnimation = true
        browser.initializePageIndex((indexPath?.row)!)
        present(browser, animated: true, completion: {})
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.images[indexPath.row].underlyingImage
        let itemProvider = NSItemProvider(object: item!)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        self.collectionView(collectionView, itemsForBeginning: session, at: indexPath)
    }
}
