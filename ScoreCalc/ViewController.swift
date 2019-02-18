//
//  ViewController.swift
//  ScoreCalc
//
//  Created by webwerks1 on 2/15/19.
//  Copyright © 2019 Neosofttechnologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   typealias userAnswer  = (Int ,Bool, Int ,Bool)
   var answer = (2, true , 26 , true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(scoreCalc(userAnswer: answer))
    }
}

extension ViewController{
    func levelWiseScore(level : Int , multiplier : Int) -> Int{
        switch level{
        case 1 :
            return level * multiplier
        case 2 :
            return 2 * multiplier
        case 3 :
            return 4 * multiplier
        case 4 :
            return 8 * multiplier
        case 5 :
            return 2 * 8 * multiplier
        case 6 :
            return 2 * 3 * 8 * multiplier
        default :
            return 0
        }
    }
    
    func scoreCalc(userAnswer : userAnswer) -> Int{
        
        switch userAnswer {
        case (let level, let answerStatus, let timeConsumed , let isFirstAttemp) where ((timeConsumed > 0 && timeConsumed <= 2) && answerStatus) :

            return isFirstAttemp ? levelWiseScore(level: level, multiplier: 100) + levelWiseScore(level: level, multiplier: 14) : levelWiseScore(level: level, multiplier: 14)
            
        case (let level, let answer,let timeConsumed  , let isFirstAttemp) where ((timeConsumed > 2 && timeConsumed <= 6) && answer) :
            
            return isFirstAttemp ? levelWiseScore(level: level, multiplier: 100) + levelWiseScore(level: level, multiplier: 10) : levelWiseScore(level: level, multiplier: 10)
            
        case (let level, let answer,let timeConsumed  , let isFirstAttemp) where ((timeConsumed > 6 && timeConsumed <= 10) && answer) :
            
            return isFirstAttemp ? levelWiseScore(level: level, multiplier: 100) + levelWiseScore(level: level, multiplier: 8) : levelWiseScore(level: level, multiplier: 8)
            
        case (let level, let answer,let timeConsumed  , let isFirstAttemp) where ((timeConsumed > 10 && timeConsumed <= 13) && answer) :
            
            return isFirstAttemp ? levelWiseScore(level: level, multiplier: 100) + levelWiseScore(level: level, multiplier: 6) : levelWiseScore(level: level, multiplier: 6)
            
        case (let level, let answer,let timeConsumed , let isFirstAttemp) where ((timeConsumed > 13 && timeConsumed <= 17) && answer) :
            
            return isFirstAttemp ? levelWiseScore(level: level, multiplier: 100) + levelWiseScore(level: level, multiplier: 4) : levelWiseScore(level: level, multiplier: 4)
            
        case (let level, let answer,let timeConsumed , let isFirstAttemp) where ((timeConsumed > 17 && timeConsumed <= 20) && answer) :
            
            return isFirstAttemp ? levelWiseScore(level: level, multiplier: 100) + levelWiseScore(level: level, multiplier: 1) : levelWiseScore(level: level, multiplier: 1)
            
        case (let level, let answer,let timeConsumed, let isFirstAttemp) where ((timeConsumed > 20 && timeConsumed <= 24) && answer) :
            
            return isFirstAttemp ? levelWiseScore(level: level, multiplier: 100) : 0
            
        case (let level, let answer,let timeConsumed  , let isFirstAttemp) where ((timeConsumed > 25) && answer) :
            
            return levelWiseScore(level: level, multiplier: -25)
            
        default  :
            return levelWiseScore(level: userAnswer.0, multiplier: -3)
        }
        
        
    }
}
