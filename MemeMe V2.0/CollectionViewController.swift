//
//  CollectionViewController.swift
//  MemeMe V2.0
//
//  Created by Jose Antonio Álvarez Vázquez on 22/2/21.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set flow layout
        let space:CGFloat = 3.0
        let dimension = (view.frame.width - (3 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
    }

    // MARK: Collection Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // The number of items is the number of memes
        return SharingMeme.sharedInstance.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create meme for row object and create cell object with custom properties
        let cellID = "collectionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
        let actualMeme = SharingMeme.sharedInstance.memes[indexPath.row]
        
        // Set cell properties
        cell.cellImage.image = actualMeme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Grab detail controller from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailController = storyboard.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        // Populate view controller with data from the selected item
        detailController.meme = SharingMeme.sharedInstance.memes[indexPath.row]
        detailController.meme.counter = indexPath.row
        
        // Present the view controller using navigation
        navigationController!.pushViewController(detailController, animated: true)
    }
    
    @IBAction func rightBarButton(_ sender: UIBarButtonItem) {
        // Grab Meme controller from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memeController = storyboard.instantiateViewController(withIdentifier: "MemeViewController")
        
        // Present the controller using navigation
        navigationController!.pushViewController(memeController, animated: true)
    }
   
}
