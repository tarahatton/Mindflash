//
//  ViewController.swift
//  MindFlash
//
//  Created by Shontara Hatton on 3/20/18.
//  Copyright © 2018 Shontara Hatton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var addQuestionLabel: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var questionArray = [Question]()
    var askedQuestions = [Question]()
    var colors = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)]
    
    var score = 0
    
    var displayedQuestion: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionLabel.layer.cornerRadius = 5
        addQuestionLabel.clipsToBounds = true
        resetButton.layer.cornerRadius = 5
        resetButton.clipsToBounds = true
        loadQuestions()
        generateQuestionText()
        
    }
    // Do any additional setup after loading the view, typically from a nib.
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadQuestions(){
        let question1 = Question (questionText: "What day starts with the letter W?", answers: ["Monday", "Tuesday", "Wednesday", "Thursday"], correctAnswer: 2)
        let question2 = Question (questionText: "What candy is fruity?", answers: ["Milky Way", "Hershey Bar", "Skittles", "Hot Cheetos"], correctAnswer: 2)
        let question3 = Question (questionText: "What number comes after Five?", answers: ["Five", "Seven", "Four", "Six"],
                                  correctAnswer: 3)
        let question4 = Question (questionText: "How many letters do the word letters have in it?", answers: ["Seven", "Eight", "Six", "Five"], correctAnswer: 0)
        
        
        questionArray.append(question1)
        questionArray.append(question2)
        questionArray.append(question3)
        questionArray.append(question4)
        
    }
    func generateAnswerButtons(question: Question, colorSelection: [UIColor]) {
        var colorArray = colorSelection
        var answers = question.answers
        for i in 0...3 {
            let randomAnswer = Int(arc4random_uniform(UInt32(answers.count)))
            let randomColor = Int(arc4random_uniform(UInt32(colorArray.count)))
            switch i {
            case 0 :
                button1.setTitle(answers[randomAnswer], for: .normal)
                button1.backgroundColor = colorArray[randomColor]
                button1.layer.cornerRadius = 5
                button1.clipsToBounds = true
            case 1:
                button2.setTitle(answers[randomAnswer], for: .normal)
                button2.backgroundColor = colorArray[randomColor]
                button2.layer.cornerRadius = 5
                button2.clipsToBounds = true
            case 2:
                button3.setTitle(answers[randomAnswer], for: .normal)
                button3.backgroundColor = colorArray[randomColor]
                button3.layer.cornerRadius = 5
                button3.clipsToBounds = true
            case 3:
                button4.setTitle(answers[randomAnswer], for: .normal)
                button4.backgroundColor = colorArray[randomColor]
                button4.layer.cornerRadius = 5
                button4.clipsToBounds = true
            default:
                return
            }
            answers.remove(at: randomAnswer)
            colorArray.remove(at: randomColor)
        }
    }
    func generateQuestionText() {
        scoreLabel.text = "Score: \(score)"
        let randomQuestionIndex =  Int(arc4random_uniform(UInt32(questionArray.count)))
        let currentQuestion = questionArray[randomQuestionIndex]
        askedQuestions.append(currentQuestion)
        questionLabel.text = currentQuestion.questionText
        displayedQuestion = currentQuestion
        questionArray.remove(at:randomQuestionIndex)
        generateAnswerButtons(question: currentQuestion, colorSelection: colors)
        
    }
    
    func gameOver() {
        let alertView = UIAlertController(title: "Game Over", message: "Your score was \(score)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Play Again!", style: .default, handler: { action in
            self.questionArray = self.askedQuestions
                self.askedQuestions = []
           })
        alertView.addAction(okAction)
        
        self.present(alertView, animated: true, completion: nil)
        score = 0
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
    }
    
    @IBAction func answerButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        if button.title(for: .normal) == displayedQuestion!.answers[(displayedQuestion!.correctAnswer)] {
            let alertView = UIAlertController(title: "Correct!", message: "You got the answer right, good job!", preferredStyle: .alert)
            score += 1
            let okAction = UIAlertAction(title: "Okay!", style: .default, handler: { action in
                if self.questionArray.count != 0 {
                self.generateQuestionText()
                }else {
                    self.gameOver()
                }
            })
            alertView.addAction(okAction)
            
            self.present(alertView, animated: true, completion: nil)
        
        } else {
            let alertView = UIAlertController(title: "Wrong!", message: "You got the answer wrong!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Okay!", style: .default, handler: { action in
                if self.questionArray.count != 0 {
                    self.generateQuestionText()
                }else {
                    self.gameOver()
                }
            })
            alertView.addAction(okAction)
            
            self.present(alertView, animated: true, completion: nil)
        
        }
    
    }
}
