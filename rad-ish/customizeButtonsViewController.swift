//
//  customizeButtonsViewController.swift
//  rad-ish
//
//  Created by Apple on 6/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class customizeButtonsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var foodName: UITextField!
    
    @IBOutlet weak var expirationTime: UITextField!
    
    // if button is pressed it will save the information in the core data
    @IBAction func saveNewFood(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let foodToSave = FoodData(entity: FoodData.entity(), insertInto: context)
            
            foodToSave.name = foodName.text
            
            foodToSave.time = expirationTime.text
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            navigationController?.popViewController(animated: true)
            
        }
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
