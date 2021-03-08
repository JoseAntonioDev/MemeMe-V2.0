//
//  TableViewController.swift
//  MemeMe V2.0
//
//  Created by Jose Antonio Álvarez Vázquez on 22/2/21.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    // MARK: Properties
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set heigh for rows
        tableView.rowHeight = 120.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
   
    // MARK: Table Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // The number of rows is the number of memes
        return appDelegate.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create meme for row and cell objects
        let actualMeme = self.appDelegate.memes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCustomCell", for: indexPath) as! TableCustomCell
        
        // Set cell properties
        cell.cellTextLabel.text = "\(actualMeme.topText!)...\(actualMeme.bottomText!)"
        cell.cellImageView.image = actualMeme.memedImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Grab detail controller from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailController = storyboard.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        //Populate view controller with data from the selected item
        detailController.meme = self.appDelegate.memes[indexPath.row]
        detailController.meme.counter = indexPath.row
        
        // Present the view controller using navigation
        navigationController!.pushViewController(detailController, animated: true)
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Allow the user to delete items from the table
        tableView.reloadData()
        if editingStyle == .delete {
            self.appDelegate.memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func rightBarButton(_ sender: UIBarButtonItem) {
        // Grab Meme controller from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memeController = storyboard.instantiateViewController(withIdentifier: "MemeViewController")
        // Present the controller using navigation
        navigationController!.pushViewController(memeController, animated: true)
    }
}
