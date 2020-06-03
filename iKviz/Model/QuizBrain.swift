//
//  QuizBrain.swift
//  iKviz
//
//  Created by Dunja Maksimovic on 5/30/20.
//  Copyright © 2020 Dunja Maksimovic. All rights reserved.
//

import Foundation

struct  QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    var quiz = [
        Question(text: "Najveće jezero na svetu zove se :", trueAnswer: "Kaspijsko", wrongAnswer1: "Titikaka", wrongAnswer2: "Bajkalsko"),
        Question(text: "Do koliko poena se igra peti set u odbojci ?", trueAnswer: "Do 15", wrongAnswer1: "Do 25", wrongAnswer2: "Do 11"),
        Question(text: "Najviši vrh na svetu je:", trueAnswer: "Mont Everest", wrongAnswer1: "Mon Blan", wrongAnswer2: "K2"),
        Question(text: "Autor knjige “Blago cara Radovana “ je:", trueAnswer: "Jovan Dučić", wrongAnswer1: "Slobodan Selenić", wrongAnswer2: "Branko Ćopić"),
        Question(text: "Dunav, međunarodna reka druga po veličini u Evropi dug je:", trueAnswer: "2850m", wrongAnswer1: "1880m", wrongAnswer2: "3025"),
        Question(text: "Čuvenu operu “ Čarobna frula” napisao je :", trueAnswer: "Mocart", wrongAnswer1: "Verdi", wrongAnswer2: "Brams"),
        Question(text: "Milorad Čavić je osvojio koju olimpijsku medalju?", trueAnswer: "srebro", wrongAnswer1: "zlato", wrongAnswer2: "bronzu")
    ]
    
    func newQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func newQuestionTrueAnswer() -> String {
        return quiz[questionNumber].trueAnswer
    }
    
    func newQuestionWrongAnswer1() -> String {
        return quiz[questionNumber].wrongAnswer1
    }
    
    func newQuestionWrongAnswer2() -> String {
        return quiz[questionNumber].wrongAnswer2
    }
    
    mutating func getScore() -> Int {
        return score
        }
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
}
