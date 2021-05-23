//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var answerTrueButton: UIButton!
    @IBOutlet weak var answerFalseButton: UIButton!
    @IBOutlet weak var quizProgressBar: UIProgressView!


    let quiz: [Question] = [
        Question(questionText: "A slug's blood is green.", correctAnswer: "True"),
        Question(questionText: "Approximately one quarter of human bones are in the feet.", correctAnswer: "True"),
        Question(questionText: "The total surface area of two human lungs is approximately 70 square metres.", correctAnswer: "True"),
        Question(questionText: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: "True"),
        Question(questionText: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: "False"),
        Question(questionText: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: "True"),
        Question(questionText: "You can lead a cow down stairs but not up stairs.", correctAnswer: "False"),
        Question(questionText: "Google was originally called 'Backrub'.", correctAnswer: "True"),
        Question(questionText: "Buzz Aldrin's mother's maiden name was 'Moon'.", correctAnswer: "True"),
        Question(questionText: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: "False"),
        Question(questionText: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: "False"),
        Question(questionText: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: "True")
    ]

    var questionNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        updateUI()
    }

    var currentTimer : Timer?

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if currentTimer?.isValid ?? false {
            NSLog("Do not press this button again")
            currentTimer?.invalidate()
            updateUI()
            return
        }

        let userAnswer = sender.currentTitle!
        var question = quiz[questionNumber]
        let isAnswerCorrect = question.checkAnswer(anAnswer: userAnswer)
        NSLog("The answer is %@", isAnswerCorrect ? "correct" : "wrong")
        sender.backgroundColor = isAnswerCorrect ? UIColor.green : UIColor.red
        questionNumber = (questionNumber + 1) % (quiz.endIndex)
        currentTimer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc private func updateUI() {
        quizProgressBar.progress = Float(questionNumber) / Float(quiz.count)
        questionTextLabel.text = quiz[questionNumber].questionText
        answerFalseButton.backgroundColor = UIColor.clear
        answerTrueButton.backgroundColor = UIColor.clear

    }

}

