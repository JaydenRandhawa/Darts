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

class ViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var turnNumber: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var turnScore: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        turnScore.keyboardType = UIKeyboardType.numberPad
        
    }
    
    var turnScores = [String]()
    
    func alert(Title:String, Message:String){
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func restart(_ sender: Any) {
        turnNumber.text = "0"
        score.text = "301"
        num = 0
        initScore = 301
        scoreNum = 301
        x = 0
        score.textColor = UIColor.black
    }
    @IBAction func zeroButton(_ sender: Any) {
        num += 1
        turnNumber.text = String(num)
        score.text = String(scoreNum)
        turnScores.append("0")
        print(turnScores)
    }
    @IBAction func enterButton(_ sender: Any) {
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
            scoreNum = initScore - tScore!
            initScore = scoreNum
            score.text = String(scoreNum)
            turnScores.append(String(scoreNum))
            print(turnScores)
        }
        if Int(turnNumber.text!)! > 1{
            x += 1
        }
        if scoreNum == 0 && tScore! > 0{
            print("end")
            initScore = 0
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
}


