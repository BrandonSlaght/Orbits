//
//  MediaAboutViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/5/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class MediaAboutViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var planet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        setupCollectionView()
        registerNibs()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - CollectionView UI Setup
    func setupCollectionView(){
        let layout = CHTCollectionViewWaterfallLayout()
        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        // Collection view attributes
        self.collectionView.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        self.collectionView.alwaysBounceVertical = true
        // Add the waterfall layout to your collection view
        self.collectionView.collectionViewLayout = layout
    }
    
    // Register CollectionView Nibs
    func registerNibs(){
        // attach the UI nib file for the ImageUICollectionViewCell to the collectionview
        let viewNib = UINib(nibName: "MediaViewCell", bundle: nil)
        collectionView.register(viewNib, forCellWithReuseIdentifier: "cell")
    }
    
    //MARK: - CollectionView Delegate Methods
    //** Number of Cells in the CollectionView */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planet.images.count
    }
    
    //** Create a basic CollectionView Cell */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create the cell and return the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaHolder
        cell.image.image = UIImage(named: planet.images[indexPath.row])
        return cell
    }
    
    //MARK: - CollectionView Waterfall Layout Delegate Methods (Required)
    //** Size for the cells in the Waterfall Layout */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        // create a cell size from the image size, and return the size
        let imageSize = UIImage(named: planet.images[indexPath.row])!.size
        return imageSize
    }
    
//    @IBAction func galeriTapped(sender: UIButton) {
//        
//        // Create browser (must be done each time photo browser is
//        // displayed. Photo browser objects cannot be re-used)
//        var browser = MWPhotoBrowser(delegate: self)
//        
//        // Set options
//        browser.displayActionButton = true // Show action button to allow sharing, copying, etc (defaults to YES)
//        browser.displayNavArrows = false // Whether to display left and right nav arrows on toolbar (defaults to NO)
//        browser.displaySelectionButtons = false // Whether selection buttons are shown on each image (defaults to NO)
//        browser.zoomPhotosToFill = true // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
//        browser.alwaysShowControls = false // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
//        browser.enableGrid = true // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
//        browser.startOnGrid = false // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
//        
//        // Optionally set the current visible photo before displaying
//        //browser.setCurrentPhotoIndex(1)
//        
//        self.navigationController?.pushViewController(browser, animated: true)
//        
//    }
//    
//    func numberOfPhotosInPhotoBrowser(photoBrowser: MWPhotoBrowser!) -> UInt {
//        return UInt(photos.count)
//    }
//    
//    func photoBrowser(photoBrowser: MWPhotoBrowser!, photoAtIndex index: UInt) -> MWPhotoProtocol! {
//        if Int(index) < self.photos.count {
//            return photos.objectAtIndex(Int(index)) as MWPhoto
//        }
//        
//        return nil
//    }

}
