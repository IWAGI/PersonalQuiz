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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
}

//MARK: - Private methods

extension QuestionsViewController {
    
    func updateUI() {
        // Hide everything
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden.toggle()
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
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single: break
        case .multiple: break
        case .ranged: break
        }
    }
    
}
