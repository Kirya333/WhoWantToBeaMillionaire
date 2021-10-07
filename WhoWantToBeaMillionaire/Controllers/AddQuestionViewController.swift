//
//  AddQuestionViewController.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 05.09.2021.
//

import UIKit

class AddQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answer1TextField: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    @IBOutlet weak var answer4TextField: UITextField!
    @IBOutlet weak var correctAnswerSegmentedControl: UISegmentedControl!
    
    private let questionsCaretaker = QuestionsCaretaker()
    private let questionsBuilder = QuestionsBuilder()
    
    @IBAction func pressAddButton(_ sender: Any) {
        if addQuestionIfPossible() {
            showMessage(title: "Successful", message: "Your question is added in the game")
            clearForm()
        } else {
            showMessage(title: "Error", message: "You should check all text fields")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
    }
    
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
    
    private func clearForm() {
        questionTextView.text = nil
        answer1TextField.text = nil
        answer2TextField.text = nil
        answer3TextField.text = nil
        answer4TextField.text = nil
        correctAnswerSegmentedControl.selectedSegmentIndex = 0
    }
    
    private func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: title, style: .cancel, handler: {_ in
            
            if title == "Successful" {
                self.dismiss(animated: true, completion: nil)
            }
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func addQuestionIfPossible() -> Bool {
        if let questionText = questionTextView.text, !questionText.isEmpty,
           let answer1 = answer1TextField.text, !answer1.isEmpty,
           let answer2 = answer2TextField.text, !answer2.isEmpty,
           let answer3 = answer3TextField.text, !answer3.isEmpty,
           let answer4 = answer4TextField.text, !answer4.isEmpty
        {
            let questions = questionsBuilder
                .setTextQuestion(questionText)
                .setAnswer(answer1)
                .setAnswer(answer2)
                .setAnswer(answer3)
                .setAnswer(answer4)
                .setCorrectAnswer(self.correctAnswerSegmentedControl.selectedSegmentIndex)
                .setNewQuestion()
                .build()
            
            Game.shared.addQuestions(questions)
            
            return true
        }
        return false
    }
    
}

