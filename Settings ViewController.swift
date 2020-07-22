//
//  Settings ViewController.swift
//  Darts
//
//  Created by Jayden Randhawa on 2020-07-21.
//  Copyright © 2020 Jayden Randhawa. All rights reserved.
//

import UIKit

var y = 0
var mTurnLabNum = 0

var switchIsOn = false

class Settings_ViewController: UIViewController {

    @IBOutlet weak var pointsController: UISegmentedControl!
    @IBOutlet weak var startingPoints: UISegmentedControl!
    @IBOutlet weak var maxTurnsStepper: UIStepper!
    @IBOutlet weak var stepperCountLabel: UILabel!
    

    
    
    @IBAction func pointsChanged(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func valueChanged(_ sender: Any) {
        switch startingPoints.selectedSegmentIndex{
                    
            case 0:
                initScore = 301
//              score.text = String(initScore)
                    
            case 1:
                initScore = 501
//              score.text = String(initScore)
                        
            default:
                break
                    }
        }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        let stepperInt = Int(sender.value)
//        if switchIsOn == true{
            stepperCountLabel.text = String(stepperInt)
//        }
    }
    
}
