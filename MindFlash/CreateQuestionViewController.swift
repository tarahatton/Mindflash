//
//  CreateQuestionViewController.swift
//  MindFlash
//
//  Created by Shontara Hatton on 3/20/18.
//  Copyright © 2018 Shontara Hatton. All rights reserved.
//

import UIKit

class CreateQuestionViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var cancelTextField: UITextField!
    @IBOutlet weak var answer1TextField: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    @IBOutlet weak var answer4TextField: UITextField!
    @IBOutlet weak var correctAnswerController: UISegmentedControl!
    
    var newQuestion: Question!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any)
    { self.dismiss(animated: true)

    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        var newQuestion = Question(questionText: cancelTextField.text!, answers: [answer1TextField.text!, answer2TextField.text!, answer3TextField.text!, answer4TextField.text!], correctAnswer: correctAnswerController.selectedSegmentIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        if (segue.identifier == "guessScreen") {
            let vc = segue.destination as! ViewController
            vc.questionArray.append(newQuestion)
        }
    }

}
