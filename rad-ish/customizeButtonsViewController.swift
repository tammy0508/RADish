//
//  customizeButtonsViewController.swift
//  rad-ish
//
//  Created by Apple on 6/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import UserNotifications

class customizeButtonsViewController: UIViewController {

    var foods = [FoodData]()
    
    
        // Do any additional setup after loading the view.
    
    

    @IBOutlet weak var foodName: UITextField!
    
    @IBOutlet weak var expirationTime: UITextField!
    
    
    
    @IBAction func notification(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        content.title = "Your food is about to being expired"
        content.subtitle = "Use your food now!"
        content.body = "Open the app to see your items!"
        content.badge = 1
        
        
        let trigger = UNTimeIntervalNotificationTrigger( timeInterval: 60.0, repeats: true )
        let request = UNNotificationRequest( identifier: "timerDoner", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert ,.sound,.badge ], completionHandler: {didAllow, error in})
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
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


}
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


