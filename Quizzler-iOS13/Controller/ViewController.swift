//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var answerTrueButton: UIButton!
    @IBOutlet weak var answerFalseButton: UIButton!
    @IBOutlet weak var quizProgressBar: UIProgressView!

    var quizBrain = QuizBrain()

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
        let isAnswerCorrect = quizBrain.checkAnswer(userAnswer)

        NSLog("The answer is %@", isAnswerCorrect ? "correct" : "wrong")
        sender.backgroundColor = isAnswerCorrect ? UIColor.green : UIColor.red

        quizBrain.nextQuestion()
        currentTimer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc private func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.score())"
        quizProgressBar.progress = quizBrain.progress()
        questionTextLabel.text = quizBrain.questionText()
        answerFalseButton.backgroundColor = UIColor.clear
        answerTrueButton.backgroundColor = UIColor.clear
    }

}

