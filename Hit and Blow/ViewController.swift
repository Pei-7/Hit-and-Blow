//
//  ViewController.swift
//  Hit and Blow
//
//  Created by 陳佩琪 on 2023/5/15.
//

import UIKit

class ViewController: UIViewController {
    
    var ballColors = ["0","1","2","3","4","5"]
    var indexOfBallColor1 :Int = 0
    var indexOfBallColor2 :Int = 0
    var indexOfBallColor3 :Int = 0
    var indexOfBallColor4 :Int = 0
    
    
    //題目
    @IBOutlet var questionballA: UIImageView!
    @IBOutlet var questionballB: UIImageView!
    @IBOutlet var questionballC: UIImageView!
    @IBOutlet var questionballD: UIImageView!
    
    
    //作答
    @IBOutlet var answerballA: UIImageView!
    @IBOutlet var answerballB: UIImageView!
    @IBOutlet var answerballC: UIImageView!
    @IBOutlet var answerballD: UIImageView!
    
    //records
    @IBOutlet var ballImageView11: UIImageView!
    @IBOutlet var ballImageView12: UIImageView!
    @IBOutlet var ballImageView13: UIImageView!
    @IBOutlet var ballImageView14: UIImageView!
    
    @IBOutlet var ballImageView21: UIImageView!
    @IBOutlet var ballImageView22: UIImageView!
    @IBOutlet var ballImageView23: UIImageView!
    @IBOutlet var ballImageView24: UIImageView!
    
    @IBOutlet var ballImageView31: UIImageView!
    @IBOutlet var ballImageView32: UIImageView!
    @IBOutlet var ballImageView33: UIImageView!
    @IBOutlet var ballImageView34: UIImageView!
    
    @IBOutlet var ballImageView41: UIImageView!
    @IBOutlet var ballImageView42: UIImageView!
    @IBOutlet var ballImageView43: UIImageView!
    @IBOutlet var ballImageView44: UIImageView!
    
    @IBOutlet var ballImageView51: UIImageView!
    @IBOutlet var ballImageView52: UIImageView!
    @IBOutlet var ballImageView53: UIImageView!
    @IBOutlet var ballImageView54: UIImageView!
    
    @IBOutlet var ballImageView61: UIImageView!
    @IBOutlet var ballImageView62: UIImageView!
    @IBOutlet var ballImageView63: UIImageView!
    @IBOutlet var ballImageView64: UIImageView!
    
    //correctness
    var hitCount = 0
    var blowCount = 0
    
    
    @IBOutlet var correctnessRow1: [UIImageView]!
    @IBOutlet var correctnessRow2: [UIImageView]!
    @IBOutlet var correctnessRow3: [UIImageView]!
    @IBOutlet var correctnessRow4: [UIImageView]!
    @IBOutlet var correctnessRow5: [UIImageView]!
    @IBOutlet var correctnessRow6: [UIImageView]!
    
    
    @IBOutlet var allRecordsImageView: [UIImageView]!
    
    @IBOutlet var hideAnswerView: UIView!
    
    @IBOutlet var resultView: UIView!
    
    
    @IBOutlet var guessButton: UIButton!
    let guessTimeText = ["First Guess","Second Guess","Third Guess","Fourth Guess","Fifth Guess","Final Guess"]
    var guessTimesIndex = 0
    
    @IBOutlet var winOrLoseString: UILabel!
    
    
    fileprivate func redomizeBalls() {
        // 題目顏色
        var ansBallColor = ballColors.shuffled().prefix(4)
        
        questionballA.image = UIImage(named:"\(ansBallColor[0])")
        questionballB.image = UIImage(named:"\(ansBallColor[1])")
        questionballC.image = UIImage(named:"\(ansBallColor[2])")
        questionballD.image = UIImage(named:"\(ansBallColor[3])")
    }
    
    
    
    fileprivate func initializeTheGame() {
        // Do any additional setup after loading the view.
        
        resultView.isHidden = true
        resultView.alpha = 0
        hideAnswerView.isHidden = false
        hideAnswerView.alpha = 1
        
        guessTimesIndex = 0
        guessButton.setTitle(guessTimeText[guessTimesIndex], for: .normal)
        
        hitCount = 0
        blowCount = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeTheGame()
        redomizeBalls()
        
        
    }

    

    @IBAction func pre11(_ sender: Any) {
        indexOfBallColor1 = (indexOfBallColor1 + 6 - 1) % 6
        answerballA.image = UIImage(named: "\(indexOfBallColor1)")
    }
    
    @IBAction func next11(_ sender: Any) {
        answerballA.image = UIImage(named: "\(indexOfBallColor1)")
        indexOfBallColor1 = (indexOfBallColor1 + 1) % 6
    }
    
    
    @IBAction func pre12(_ sender: Any) {
        indexOfBallColor2 = (indexOfBallColor2 + 6 - 1) % 6
        answerballB.image = UIImage(named: "\(indexOfBallColor2)")
    }
    
    @IBAction func next12(_ sender: Any) {
        answerballB.image = UIImage(named: "\(indexOfBallColor2)")
        indexOfBallColor2 = (indexOfBallColor2 + 1) % 6
    }
    
    @IBAction func pre13(_ sender: Any) {
        indexOfBallColor3 = (indexOfBallColor3 + 6 - 1) % 6
        answerballC.image = UIImage(named: "\(indexOfBallColor3)")
    }
    
    @IBAction func next13(_ sender: Any) {
        answerballC.image = UIImage(named: "\(indexOfBallColor3)")
        indexOfBallColor3 = (indexOfBallColor3 + 1) % 6
    }
    
    @IBAction func pre14(_ sender: Any) {
        indexOfBallColor4 = (indexOfBallColor4 + 6 - 1) % 6
        answerballD.image = UIImage(named: "\(indexOfBallColor4)")
    }
    
    @IBAction func next14(_ sender: Any) {
        answerballD.image = UIImage(named: "\(indexOfBallColor4)")
        indexOfBallColor4 = (indexOfBallColor4 + 1) % 6
    }
    
    
    
    
    
    fileprivate func showResult() {
        resultView.isHidden = false
        UIView.animate(withDuration: 1.2, animations: { [weak self] in
            self?.resultView.alpha = 1
        }) { [weak self] _ in
            self?.resultView.isHidden = false
        }
        
        UIView.animate(withDuration: 1.2, animations: { [weak self] in
            self?.hideAnswerView.alpha = 0
        }) { [weak self] _ in
            self?.hideAnswerView.isHidden = true
        }
    }
    
    
    @IBAction func submitActoin(_ sender: Any) {
        

        guessTimesIndex = (guessTimesIndex + 1) % 6
        guessButton.setTitle(guessTimeText[guessTimesIndex], for: .normal)
        
        
        let guesses = [answerballA.image, answerballB.image, answerballC.image,answerballD.image]
        let correctAnswer = [questionballA.image, questionballB.image, questionballC.image, questionballD.image]
        let uniqueGuesses = Array(Set(guesses))
        
//hit
        for (index,guess) in guesses.enumerated() { //index 要放在 guess 前面！
                if guess == correctAnswer[index] {
                    hitCount += 1
                }
        }
        print(hitCount)

//blow
        for guess in uniqueGuesses {
            if correctAnswer.contains(guess) {
                blowCount += 1
            }
        }
        blowCount = blowCount - hitCount
        print(blowCount)
        
//correctness indicators
        var correctnessStatus :[String] = []
        if hitCount > 0 {
            for _ in 1 ... hitCount {
                correctnessStatus.append("7")
            }
        }
        if blowCount > 0 {
            for _ in 1 ... blowCount {
                correctnessStatus.append("9")
            }
        }
        
        while correctnessStatus.count < 4 {
            correctnessStatus.append("8")
        }
        print(correctnessStatus)


        if guessTimesIndex == 1 {
            ballImageView11.image = answerballA.image
            ballImageView12.image = answerballB.image
            ballImageView13.image = answerballC.image
            ballImageView14.image = answerballD.image
            for (index, imageView) in correctnessRow1.enumerated() {
                    imageView.image = UIImage(named: correctnessStatus[index])
            }
        } else if guessTimesIndex == 2 {
            ballImageView21.image = answerballA.image
            ballImageView22.image = answerballB.image
            ballImageView23.image = answerballC.image
            ballImageView24.image = answerballD.image
            for (index, imageView) in correctnessRow2.enumerated() {
                    imageView.image = UIImage(named: correctnessStatus[index])
            }
        } else if guessTimesIndex == 3 {
            ballImageView31.image = answerballA.image
            ballImageView32.image = answerballB.image
            ballImageView33.image = answerballC.image
            ballImageView34.image = answerballD.image
            for (index, imageView) in correctnessRow3.enumerated() {
                    imageView.image = UIImage(named: correctnessStatus[index])
            }
        } else if guessTimesIndex == 4 {
            ballImageView41.image = answerballA.image
            ballImageView42.image = answerballB.image
            ballImageView43.image = answerballC.image
            ballImageView44.image = answerballD.image
            for (index, imageView) in correctnessRow4.enumerated() {
                    imageView.image = UIImage(named: correctnessStatus[index])
            }
        } else if guessTimesIndex == 5 {
            ballImageView51.image = answerballA.image
            ballImageView52.image = answerballB.image
            ballImageView53.image = answerballC.image
            ballImageView54.image = answerballD.image
            for (index, imageView) in correctnessRow5.enumerated() {
                    imageView.image = UIImage(named: correctnessStatus[index])
            }
        } else if guessTimesIndex == 0 {
            ballImageView61.image = answerballA.image
            ballImageView62.image = answerballB.image
            ballImageView63.image = answerballC.image
            ballImageView64.image = answerballD.image
            for (index, imageView) in correctnessRow6.enumerated() {
                    imageView.image = UIImage(named: correctnessStatus[index])
            }
            
            showResult()
            winOrLoseString.text = "You lose!"
        }
        
        
        if correctnessStatus == ["7","7","7","7"] {
            showResult()
            winOrLoseString.text = "You win!"
        }

        
        indexOfBallColor1 = 0
        indexOfBallColor2 = 0
        indexOfBallColor3 = 0
        indexOfBallColor4 = 0
        
        hitCount = 0
        blowCount = 0
        
        answerballA.image = UIImage(named: "11")
        answerballB.image = UIImage(named: "11")
        answerballC.image = UIImage(named: "11")
        answerballD.image = UIImage(named: "11")
 
    }
    
    


    @IBAction func restartAction(_ sender: UIButton) {

        redomizeBalls()
        initializeTheGame()
        
        //一次連接太多 array 會有 error: "The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions"
        let allIndicators1 = correctnessRow1 + correctnessRow2 + correctnessRow3
        let allIndicators2 = correctnessRow4 + correctnessRow5 + correctnessRow6
        let all = allRecordsImageView + allIndicators1 + allIndicators2
        
        for images in all {
            images.image = UIImage(named: "8")
        }
        

    }
}


