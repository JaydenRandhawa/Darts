//
//  ViewController.swift
//  Darts
//
//  Created by Jayden Randhawa on 2019-09-05.
//  Copyright © 2019 Jayden Randhawa. All rights reserved.
//

import UIKit
var num = 0
var initScore = 301
var scoreNum = 301
var x = 0
var maxTurns = 100

class ViewController: UIViewController, UITextFieldDelegate {
    
    var passedData = Int()
    

    @IBOutlet weak var turnNumber: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var turnScore: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.navigationController?.isNavigationBarHidden = true
        
        turnScore.keyboardType = UIKeyboardType.numberPad
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    var turnScores = [String]()
    
    class TabBarSelect: UITabBarController, UITabBarControllerDelegate{
        override func tabBar (_ tabBar: UITabBar, didSelect item:UITabBarItem){
            print("Selected Item")
        }
        
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            print("Selected view controller")
        }
    }
    
    func alert(Title:String, Message:String){
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func restart(_ sender: Any) {
        turnNumber.text = "0"
        score.text = String(initScore)
        num = 0
//        initScore = 301
        scoreNum = initScore
        x = 0
        score.textColor = UIColor.black
    }

    @IBAction func zeroButton(_ sender: Any) {
        num += 1
        turnNumber.text = String(num)
        if num == maxTurns{
            alert(Title: "Game Over", Message: "You lost because all turns have been played")
        }
        score.text = String(scoreNum)
        turnScores.append("0")
        print(turnScores)
    }
    @IBAction func enterButton(_ sender: Any) {
        if turnScore.text == ""{
            alert(Title: "Turn Score is empty", Message: "Please enter a turn score before pressing enter")
        }
        let tScore = Int(turnScore.text!)
        let Score = Int(score.text!)
        
        turnScore.resignFirstResponder()
        
        if tScore! < 0{
            alert(Title: "Turn Score Value Is Less Than 0", Message: "Please Enter a Turn Score Value greater than 0.")
        }
        else if tScore! > scoreNum{
            alert(Title: "Turn Score Greater than Remaining Points", Message: "The Turn Score You Just Entered Is Greater Than The Remaining Points.")
        }
        else{
            num += 1
            turnNumber.text = String(num)
            if num == maxTurns{
                alert(Title: "Game Over", Message: "You lost because all turns have been played")
            }
            scoreNum = scoreNum - tScore!
            score.text = String(scoreNum)
            turnScores.append(String(scoreNum))
            print(turnScores)
        }
        if Int(turnNumber.text!)! > 1{
            x += 1
        }
        if scoreNum == 0 && tScore! > 0{
            print("end")
            scoreNum = 0
            alert(Title: "Game Ended", Message: "You Have Won the Game.")
            score.textColor = UIColor.black
        }
        if tScore! == 0{
            alert(Title: "Turn Score is equal to 0", Message: "If Your Turn Score is 0, You Can Use the 0 Button")
        }
        if Score! < 60{
            score.textColor = UIColor.red
        }
        
        
        }
    
    func setScore(){
        score.text = String(initScore)
        
    }
    
}
