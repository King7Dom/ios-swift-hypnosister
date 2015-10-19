//
//  QuizViewController.swift
//  Quiz-Swift
//
//  Created by Dominic Cheung on 24/09/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var currentQuestion: Int = 0
    var questions = [
        "From what is Cognac made of?",
        "What is 7+7?",
        "What is the capital of Vermont?"]
    var answers = [
        "Grapes",
        "14",
        "Montpelier"]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    // MARK: Initialization
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.tabBarItem.title = "Quiz"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if currentQuestion >= self.questions.count {
            currentQuestion = 0
        }
        self.questionLabel.text = self.questions[currentQuestion]
        self.answerLabel.text = "???"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UIButton delegate
    
    @IBAction func showQuestion(sender: UIButton) {
        currentQuestion++
        if currentQuestion >= self.questions.count {
            currentQuestion = 0
        }
        self.questionLabel.text = self.questions[currentQuestion]
        self.answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender: UIButton) {
        self.answerLabel.text = self.answers[currentQuestion]
    }

}
