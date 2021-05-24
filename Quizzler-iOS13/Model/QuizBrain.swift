//
// Created by Thomas Strauß on 24.05.21.
// Copyright (c) 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
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

    func score() -> Int {
        userScore
    }

    func questionText() -> String {
        quiz[questionNumber].questionText
    }

    func progress() -> Float {
        Float(questionNumber) / Float(quiz.count)
    }

    var questionNumber = 0
    var userScore = 0

    mutating func nextQuestion() {
        questionNumber = (questionNumber + 1) % (quiz.endIndex)
        if questionNumber == 0 {
            reset()
        }
    }

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let isCorrect = userAnswer == quiz[questionNumber].correctAnswer

        if isCorrect {
            increaseScore()
        }

        return isCorrect
    }

    mutating private func increaseScore() {
        userScore += 1
    }

    mutating func reset() {
        questionNumber = 0
        userScore = 0
    }
}