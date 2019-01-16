 //
//  GoalCell.swift
//  goalpost-app
//
//  Created by Rifqi Alfaizi on 19/12/18.
//  Copyright © 2018 Rifqi Alfaizi. All rights reserved.
//

import UIKit


class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescrptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    func  configureCell(goal: Goal) {
        self.goalDescrptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl .text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false }
                else {
                    self.completionView.isHidden = true
                }
            }
        }
 

