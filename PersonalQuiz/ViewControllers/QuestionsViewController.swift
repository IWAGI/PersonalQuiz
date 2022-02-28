//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by Mikhail on 28.02.2022.
//

import UIKit

class QuestionsViewController: UIViewController {

//MARK: - IB Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    //MARK: - Private Properties
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    private var answers: [Answer] {
        questions[questionIndex].answers
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
//MARK: - IB Actions
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndexButton = singleButtons.firstIndex(of: sender) else { return }
        
        let currentAnswer = answers[currentIndexButton]
        answersChoosen.append(currentAnswer)
        nextQuestion()
    }
    
    
    @IBAction func multipleButtonAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, answers) {
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonAnswerPressed() {
        let index = lroundf(rangedSlider.value * Float(answers.count - 1))
        let currentAnswer = answers[index]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
}

//MARK: - Private methods

extension QuestionsViewController {
    
    func updateUI() {
        // Hide everything
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
//        singleStackView.isHidden.toggle()
//        multipleStackView.isHidden.toggle()
//        rangedStackView.isHidden.toggle()
        
        //Get current question
        let currentQuestion = questions[questionIndex]
        
        //Set current question for question label
        questionLabel.text = currentQuestion.text
        
        //Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        //Set progress for progress question view
        questionProgressView.setProgress(totalProgress, animated: true)
        
        //Set navigation title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
                
        switch type {
        case .single: showSingleStackView(with: answers)
        case .multiple: showMultipleStackView(with: answers)
        case .ranged: showRangedStackView(with: answers)
        }
    }
    
    /// Setup single stack view.
    ///
    /// - Parameter answers: Array with answers.
    ///
    /// Description of the method.
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text

    }
}

//MARK: - Navigation

extension QuestionsViewController {
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }

}
