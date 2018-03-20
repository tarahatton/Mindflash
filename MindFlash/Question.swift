//
//  Question.swift
//  MindFlash
//
//  Created by Shontara Hatton on 3/20/18.
//  Copyright © 2018 Shontara Hatton. All rights reserved.
//

import Foundation

class Question {
    var questionText: String
    var answers: [String]
    var correctAnswer: Int
    init(questionText: String, answers: [String], correctAnswer: Int) {
        self.questionText = questionText
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
