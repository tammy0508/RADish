//
//  ItemListViewController.swift
//  rad-ish
//
//  Created by Apple on 6/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //refers to each row- allows to use attributes
        let cell = UITableViewCell()
        let foodCell = foods[indexPath.row]
        // the information displayed on the cell
        cell.textLabel?.text = "\(foodCell.name!):  \(foodCell.time!) days till expiration"
        
        return cell
    }
    
    var array = ["1"]
    
    var foods = [FoodData]()
    

    //allows reording of cells. Tells the computer we want the people to be able to reorder
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //lets the user rearrange the cells
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row)
        
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBAction func edit(_ sender: Any) {
        // each time the user clicks the button the user is switching between editing and not editing
        myTableView.isEditing = !myTableView.isEditing
        
        //changes the edit button to done when editing
        switch myTableView.isEditing {
        case true:
            editButton.title = "done"
        case false:
            editButton.title = "edit"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displayfoodItems()
    }

   

    // allows to display data in core data
    func displayfoodItems() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataFoodData = try? context.fetch(FoodData.fetchRequest()) as? [FoodData] {
                foods = coreDataFoodData
                myTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
}


    

