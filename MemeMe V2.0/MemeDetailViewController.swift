//
//  MemeDetailViewController.swift
//  MemeMe V2.0
//
//  Created by Jose Antonio Álvarez Vázquez on 24/2/21.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet var memeImage: UIImageView!
 
    var meme: MemeViewController.Meme!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // set image to show and hide nav and tab bars
        memeImage.image = meme.memedImage
        navigationController!.setNavigationBarHidden(true, animated: false)
        tabBarController!.tabBar.isHidden = true
        }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController!.tabBar.isHidden = false
        navigationController!.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: Methods
    @IBAction func editMeme(_ sender: UIBarButtonItem) {
        // Grab detail controller from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memeController = storyboard.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
        
        //Populate view controller with data from the selected item
        memeController.meme = self.meme
        
        // Present the view controller using navigation
        navigationController!.pushViewController(memeController, animated: true)
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem){
        navigationController!.popViewController(animated: true)
    }
}
