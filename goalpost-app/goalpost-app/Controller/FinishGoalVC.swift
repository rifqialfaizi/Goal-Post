//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Rifqi Alfaizi on 28/12/18.
//  Copyright © 2018 Rifqi Alfaizi. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyBoard()
        pointsTextField.delegate = self
    }
    
    @IBAction func createBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)

                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("pokoknya sukses lah hehe")
            completion(true)
        } catch {
            debugPrint("could not save: \(error.localizedDescription)")
            completion(false)
        }
        
    }
}
