//
//  PlayerDetailsViewControllerTableViewController.swift
//  Ratings
//
//  Created by Zenika on 12/07/2017.
//  Copyright © 2017 DevArtisant. All rights reserved.
//

import UIKit

class PlayerDetailsViewControllerTableViewController: UITableViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    var player:Player?
    
    var game:String = "Chess" {
        didSet {
            detailLabel.text? = game
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if indexPath.section == 0 {
             nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text!, game: game, rating: 1)
        }
        else if segue.identifier == "PickGame" {
            if let gamePickerViewController = segue.destination as? GamePickerViewController {
                gamePickerViewController.selectedGame = game
            }
        }
    }
    
    @IBAction func unwindWithSelectedGame(segue:UIStoryboardSegue) {
        if let gamePickerViewController = segue.source as? GamePickerViewController,
            let selectedGame = gamePickerViewController.selectedGame {
            game = selectedGame
        }
    }
    
}
