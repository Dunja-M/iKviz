//
//  ViewController.swift
//  iKviz
//
//  Created by Dunja Maksimovic on 5/30/20.
//  Copyright © 2020 Dunja Maksimovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
       updateUI()
    }

    @objc func updateUI () {
        
//      writing question, score and progress
        questionLabel.text = quizBrain.newQuestionText()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
//      shuffling answers
        for (index, button) in answerButtons.enumerated() {
            switch index {
            case 0:
                button.setTitle(quizBrain.newQuestionTrueAnswer(), for: .normal)
            case 1:
                button.setTitle(quizBrain.newQuestionWrongAnswer1(), for: .normal)
            case 2:
                button.setTitle(quizBrain.newQuestionWrongAnswer2(), for: .normal)
            default:
                break
            }
            button.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        }
        answerButtons.shuffle()
    }
        
    @IBAction func answerButton(_ sender: UIButton) {
//      checking answer
        let userAnswer = sender.currentTitle
     
        if userAnswer == quizBrain.quiz[quizBrain.questionNumber].trueAnswer {
            quizBrain.score += 1
    
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:#selector(updateUI), userInfo: nil, repeats: false)
        
        if quizBrain.questionNumber + 1 < quizBrain.quiz.count {
        quizBrain.questionNumber += 1
        } else {
            
            let alert = UIAlertController(title: "Bravo! Tvoj rezultat je \(quizBrain.score)", message: "zelite li da igrate ispocetka?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "zelim", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
          
            quizBrain.score = 0
            quizBrain.questionNumber = 0
            
        }
        
        // Pogledaj koji je odgovor korisnik odabrao
        // Vidi da li je odgovor tačan
        
        // Sevni neke boje da pokažeš da li je tačno
        
        // Pokaži sledeće pitanje
        
    }
        
}

