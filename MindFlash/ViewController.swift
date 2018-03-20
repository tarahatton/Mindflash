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
    
    var questionArray = [Question]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadQuestions(){
        let question1 = Question (questionText: "What day starts with the letter W?", answers: ["Monday", "Tuesday", "Wednesday", "Thursday"], correctAnswer: 2)
        questionArray.append(question1)
    }
    @IBAction func resetButtonTapped(_ sender: Any) {
    }
    @IBAction func answerButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
            print(button.tag)
        
    }
    

}

