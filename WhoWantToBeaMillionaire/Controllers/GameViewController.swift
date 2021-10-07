//
//  GameViewController.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 31.08.2021.
//

import Foundation
import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func gameViewController(_ viewController: GameViewController, chooseCorrectAnswer question: Question)
}


class GameViewController: UIViewController {
    
    weak var delegate: GameViewControllerDelegate?
    
    @IBOutlet weak var questionTableView: UITableView!
    @IBOutlet weak var hintLabel: UILabel!
    
    var questions = Game.shared.questions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionTableView.delegate = self
        questionTableView.dataSource = self
    }
}

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions[section].answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return questionTableView.dequeueReusableCell(withIdentifier: "AnswerCellIdentifier", for: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let label = createHeaderLabel(section)
        label.autoresizingMask = [.flexibleHeight]
        headerView.addSubview(label)
        
        return headerView
        
    }
    
    func createHeaderLabel(_ section: Int) -> UILabel {
        
        let widthPadding: CGFloat = 15.0
        let label: UILabel = UILabel(frame: CGRect(x: widthPadding, y: 0, width: self.view.frame.width - widthPadding * 2, height: 0))
        label.text = questions[section].question
        label.numberOfLines = 0;
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let question = questions[indexPath.section]
        cell.textLabel?.text = question.answers[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let question = questions[indexPath.section]
        
        if question.correctAnswer == indexPath.row {
            self.delegate?.gameViewController(self, chooseCorrectAnswer: question)
            questions.remove(at: indexPath.section)
            
            if questions.count > 0 {
                tableView.reloadData()
            } else {
                self.endGame()
            }
        } else {
            self.endGame()
        }
    }
    
    func endGame() {
        Game.shared.endGame()
        self.dismiss(animated: true, completion: nil)
    }
}
