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
    
    var images = [SKPhoto]()
    
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
        for image in planet.images {
            let item = SKPhoto.photoWithImage(UIImage(named: image.image)!)
            item.caption = image.caption
            images.append(item)
        }
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
        cell.image.image = UIImage(named: planet.images[indexPath.row].image)
        return cell
    }
    
    //MARK: - CollectionView Waterfall Layout Delegate Methods (Required)
    //** Size for the cells in the Waterfall Layout */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        // create a cell size from the image size, and return the size
        let imageSize = UIImage(named: planet.images[indexPath.row].image)!.size
        return imageSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MediaHolder
        let originImage = cell.image.image! // some image for baseImage
        
        let browser = SKPhotoBrowser(originImage: originImage, photos: images, animatedFromView: cell)
        //SKPhotoBrowserOptions.displayHorizontalScrollIndicator = true
        //SKPhotoBrowserOptions.displayVerticalScrollIndicator = true
        SKPhotoBrowserOptions.bounceAnimation = true
        browser.initializePageIndex(indexPath.row)
        //browser.navigationItem.title = "test"
        present(browser, animated: true, completion: {})
    }
}
