//
//  ViewController.swift
//  Quiz
//
//  Created by jyotishankar sahoo on 29/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentQuestionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var nextQuestionLabel : UILabel!
    
    @IBOutlet weak var currentQuestionCenterXConstant : NSLayoutConstraint!
    
    @IBOutlet weak var nextQuestionCenterXConstant : NSLayoutConstraint!
    
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
        self.nextQuestionLabel.text = questions[currentQuestionIndex]
        self.answerLabel.text = "???"
        self.animateLabel()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        self.answerLabel.text = answers[currentQuestionIndex]
    }
    
    //MARK: View Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.currentQuestionLabel.alpha = 1
        self.nextQuestionLabel.alpha = 0
        self.updateOffSet()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentQuestionLabel.text = questions[currentQuestionIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateOffSet(){
        let screenWidth = self.view.bounds.width
        self.nextQuestionCenterXConstant.constant = -screenWidth
    }
    
    //MARK: - Animation
    
    func animateLabel()  {
        self.view.layoutIfNeeded()
                
        //Silver Challenge
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 1.1, initialSpringVelocity: 1, options: [.CurveEaseInOut], animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            self.nextQuestionCenterXConstant.constant = 0
            self.currentQuestionCenterXConstant.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            }) { (_) in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionCenterXConstant, &self.nextQuestionCenterXConstant)
                self.updateOffSet()
        }
    }
}

