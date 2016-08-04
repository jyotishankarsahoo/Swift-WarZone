//
//  ViewController.swift
//  Quiz
//
//  Created by jyotishankar sahoo on 29/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    //Model layer
    
    let questions : [String] = ["From what Cognac is made","What is 7 * 7","What is capital of Vermon"]
    let answers : [String] = ["Grape","49","Montpelier"]
    
    var currentQuestionIndex : Int = 0
    
    //MARK: - Action Methods
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == answers.count {
            currentQuestionIndex = 0
        }
        self.questionLabel.text = questions[currentQuestionIndex]
        self.answerLabel.text = "???"
        self.animateLabel()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        self.answerLabel.text = answers[currentQuestionIndex]
    }
    
    //MARK: View Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.questionLabel.alpha = 0.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionLabel.text = questions[currentQuestionIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Animation
    
    func animateLabel()  {
        let animationClousre = {() -> Void in
        self.questionLabel.alpha = 1
        }
        
        UIView.animateWithDuration(2, animations: animationClousre)
    }
    
    

}

