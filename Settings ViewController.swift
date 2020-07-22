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

class Settings_ViewController: UIViewController {

    @IBOutlet weak var pointsController: UISegmentedControl!
    @IBOutlet weak var startingPoints: UISegmentedControl!
    @IBOutlet weak var maxTurnSwitch: UISwitch!
    @IBOutlet weak var maxTurnNumber: UITextField!
    

    
    
    @IBAction func pointsChanged(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        maxTurnNumber.keyboardType = UIKeyboardType.numberPad
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
    //                    score.text = String(initScore)
                    
                    case 1:
                        initScore = 501
            //            score.text = String(initScore)
                        
                    default:
                        break
                    }
        }
    @IBAction func switchChanged(_ sender: Any) {
        if maxTurnSwitch.isOn == true{
            while maxTurnNumber.text == "" && y < 10{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    print("waiting for maximum turn number", y)
                    
                    y+=1
                }
            }
            if maxTurnNumber.text == ""{
                maxTurnNumber.text = String(maxTurns)
            }
            mTurnLabNum = Int(maxTurnNumber.text!)!
                
            if maxTurnNumber.text != ""{
                maxTurns = mTurnLabNum
            }
        
        
        if maxTurnSwitch.isOn == false{
            
            maxTurns = 100
        }
        
    }
    //    @IBAction func applyChanges(_ sender: Any) {
//        let scoreboardVC = UIStoryboard(name: "Scoreboard", bundle: nil).instantiateViewController(withIdentifier: "scoreboard") as! ViewController
//
//        scoreboardVC.passedData = initScore
//        self.present(scoreboardVC, animated: true, completion: nil)
//    }
}
}
